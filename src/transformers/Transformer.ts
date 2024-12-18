import SQS from 'aws-sdk/clients/sqs'
export default interface Transformer {
	transform(message: { [key: string]: string }): SQS.SendMessageBatchRequestEntry;
}
