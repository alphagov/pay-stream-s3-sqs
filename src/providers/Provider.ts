import { Readable } from 'stream'
export type Message = { [key: string]: any }
export interface ProgressPage {
	messages: Message[];
	progress: number;
}
export interface Provider {
	stream(): Readable;
}