import { Readable } from 'stream'
export type MessageValue = string
export type Message = { [key: string]: MessageValue }
export interface ProgressPage {
	messages: Message[];
	progress: number;
}
export interface Provider {
	stream(): Readable;
}
