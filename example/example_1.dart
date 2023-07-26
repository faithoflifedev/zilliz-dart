import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';
import 'package:loggy/loggy.dart';
import 'package:universal_io/io.dart';
import 'package:zilliz/zilliz.dart';

void main() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

  if (openaiApiKey == null) {
    stderr.writeln('You need to set your OpenAI key in the '
        'OPENAI_API_KEY environment variable.');
    exit(1);
  }

  final zilliz = Zilliz(
      zillizUrl:
          'https://in03-410eb738b4b5e5b.api.gcp-us-west1.zillizcloud.com',
      logOptions: const LogOptions(
        LogLevel.error,
        stackTraceLevel: LogLevel.off,
      ));

  final embeddings = OpenAIEmbeddings(apiKey: openaiApiKey);

  final docSearch = await ZillizVectorStore(
    zilliz: zilliz,
    collection: 'hadith',
    embeddings: embeddings,
  );

  final llm = ChatOpenAI(
    apiKey: openaiApiKey,
    model: 'gpt-3.5-turbo-16k-0613',
  );

  final qaChain = OpenAIQAWithSourcesChain(llm: llm);

  final docPrompt = PromptTemplate.fromTemplate(
    'Content: {page_content}\nSource: {source}',
  );

  final finalQAChain = StuffDocumentsChain(
    llmChain: qaChain,
    documentPrompt: docPrompt,
  );

  final retrievalQA = RetrievalQAChain(
    retriever: docSearch.asRetriever(),
    combineDocumentsChain: finalQAChain,
  );

  const query = 'What did aisha say about Al-Harith bin Hisham?';

  final res = await retrievalQA(query);

  print(query);
  print(res['result']);
}
