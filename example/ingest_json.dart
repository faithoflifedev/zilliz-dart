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

  await zilliz.dropCollection('hadith');

  await zilliz.createCollection(Collection(
    collectionName: 'hadith',
    dimension: 1536,
  ));

  final loader = JsonLoader(
    'hadith.json',
    jpSchema: r'$[*]',
    contentKey: r'.hadiths[0].text',
    metadataBuilder: (matchValue, fileMetadata) {
      final values = matchValue as Map<String, dynamic>;
      return {
        'source':
            '${values['metadata']['name']}, book: ${values['hadiths'][0]['reference']['book']}, hadith: ${values['hadiths'][0]['reference']['hadith']}',
        'data': values['hadiths'][0]['text'],
        'metadata': fileMetadata,
      };
    },
  );

  final documents = await loader.load();

  final embeddings = OpenAIEmbeddings(
    apiKey: openaiApiKey,
    model: 'text-embedding-ada-002',
  );

  await ZillizVectorStore.fromDocuments(
    zilliz: zilliz,
    collection: 'hadith',
    documents: documents,
    embeddings: embeddings,
  );
}
