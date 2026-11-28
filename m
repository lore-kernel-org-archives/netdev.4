Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795837756;
	b=RlQ2cT6YcBhA0EDyRuaM44LCXfDSFS0ym7fMqmRWPZj2KAbkcuvIaUYNzqV4YybBqmkQ
	 qBBCOZoDFG8tNMr7CsZVw1ckJr3eoNDBEH7i5fSLwoEd9VGJ95R9xJ80HQc82FPJHtKoI
	 Is7ZJG5ohP0UAvF0l+70XHct432B/zZWn356CXdJa/ev8eoWZFCTE0d9k39uhjM7i6ydY
	 AwY9bq99r/FAkM5YJjBVdllwR7G1BLduwbol9ggxmd0cGHHiJHKROGrurmxv8dx6PNtiJ
	 lWAsABTTWHUORbqrBZ4E1eyp2+bLnKwAv+sjEd4+yAxRXwWr7SVKYmE2+Y5W/+pGDEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795837756;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=VhY4IcjPurkabNF69aOs00+tTjgl9zsf3kDoomd3ODs=;
	b=fyVTe98uKASVxS/NHyNQ7dhv6g/oiWRlyyjtZwSXIeWGby2pQ/xAthf3yf8WJwyL5r0+
	 ieZWHToYkfQPiUKMY6bw6nDdbNJOHw5fnFM/WICBYoVBfqevZC0XBh/3ZxuDY5CJmYKzk
	 hYeHK4CeWmTfHc5yf9F2Ig+0KZmgR2kyPkDNn9T2gOQNZDTqQGNyRKF6gPHt3wvXOzBZw
	 buyLqnWyvYC14+QR4VInEzPcLkyIrTKMTVEzxBlRVQy2sMUSS0AvjiVH1y8KiuKEFqFss
	 ehtGoixYrx2h4k+h4uYLwxzHSFxJkJ3Rooj324q/rgv5oLMVgPEiE7aODhbqUyxqFWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l40rBSOq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A6F606A31C
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 03:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l40rBSOq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67AFC1F000C1;
	Sat, 28 Nov 2026 03:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795837756;
	bh=VhY4IcjPurkabNF69aOs00+tTjgl9zsf3kDoomd3ODs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=l40rBSOqhWSdHMlRSkGE/Sgic8D2ruM661issrjM+3UTL93Sw5tI8FG6LGa4ntcxg
	 GmBSUwo3qd/Ic3xgQMKAX6sxnTOw8CMmAb8aRAalGCO96XMKo555L+vdAFZDQ2YfH5
	 /O0dpLyu9G7/yqEnJsalBXqVZWxUygkTKCQn1rfdQots0dLKpx+Vix+5ejF/myTJan
	 5KgK15nxBUBr7ptIa0NJ0/4EW71sw/hU11IIMc2f7RQa3iifXShI+RVW2TSbVV7Tto
	 ZnKTYAhbNtPaJ8wCgXyUWybhEdrFzvPzE/6ACf2FG9yUGDguUzCsrd2SM6QVFSrRpA
	 lpEzDQeF8+h3w==
Subject: Re: [PATCH net] net: wwan: iosm: return the callback result of
 synchronous tasks
From: netdev-bot+sashiko@kernel.org
To: davidlwesten@gmail.com
Cc: netdev@vger.kernel.org, loic.poulain@oss.qualcomm.com,
 ryazanov.s.a@gmail.com, johannes@sipsolutions.net, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 m.chetan.kumar@intel.com
Date: Sat, 28 Nov 2026 03:49:14 +0000
Message-ID: <179583775492.3135.6308026077719961194@kernel.org>
In-Reply-To: <20261127034849.11770-1-davidlwesten@gmail.com>
References: <20261127034849.11770-1-davidlwesten@gmail.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix still leaves a way for a late device reply to call
  complete() on a returned stack frame.
- [Medium] The patch now passes the callback result through unchanged,
  and ipc_protocol_msg_send() uses it as the rsp_ring index.

--

net: wwan: iosm: return the callback result of synchronous tasks

This patch makes ipc_task_queue_send_task() return the callback result
instead of 0 when the task was queued and completed. ipc_protocol_msg_send()
uses that value as the rsp_ring index. With this change, a timeout clears
the slot that actually points at its on-stack response.

> diff --git a/drivers/net/wwan/iosm/iosm_ipc_task_queue.c b/drivers/net/wwan/iosm/iosm_ipc_task_queue.c
> index 7cb2f6a506d9f..069075481825e 100644
> --- a/drivers/net/wwan/iosm/iosm_ipc_task_queue.c
> +++ b/drivers/net/wwan/iosm/iosm_ipc_task_queue.c
> @@ -162,10 +162,8 @@ int ipc_task_queue_send_task(struct iosm_imem *imem,
>  			copy, size, is_copy);
>  		if (is_copy)
>  			kfree(copy);
> -		goto out;
>  	}
>  
> -	ret = 0;
>  out:
>  	return ret;
>  }

[Severity: High]
The index is now correct. Can a late reply still call complete() on a
returned stack frame if the remove task itself fails to queue?

The timeout path in ipc_protocol_msg_send() ignores the return value of
the remove call:

drivers/net/wwan/iosm/iosm_ipc_protocol.c:ipc_protocol_msg_send() {
    ...
	case 0:
		ipc_task_queue_send_task(ipc_protocol->imem,
					 ipc_protocol_tq_msg_remove, index,
					 NULL, 0, true);
		dev_err(ipc_protocol->dev, "msg timeout");
    ...
	return 0;
}

If the 256-entry task ring is full, ipc_task_queue_add_task() takes the
"queue is full" branch. It then returns -EIO without ever running
ipc_protocol_tq_msg_remove():

	if (nextpos != ipc_task->q_rpos) {
		...
	}
	...
	} else {
		dev_err(ipc_imem->ipc_task->dev, "queue is full");
	}

In that case rsp_ring[index] still points at the on-stack struct ipc_rsp
response after ipc_protocol_msg_send() has returned 0. When the device
answers later, ipc_protocol_msg_process() does:

		if (rsp_ring[i]) {
			rsp_ring[i]->status =
				le32_to_cpu(msg->common.completion_status);
			complete(&rsp_ring[i]->completion);
			rsp_ring[i] = NULL;
		}

That looks like the same oops shown in the commit message, which says:

    so a timeout clears slot 0 and leaves the real slot pointing to the
    returned stack frame. A late reply then calls complete() on it

Should the failed enqueue be handled too? Some options would be retrying,
clearing the slot under a lock the tasklet also takes, or not returning
while rsp_ring[index] can still reference the stack.

[Severity: Medium]
Now that the exact callback result is used as an rsp_ring index, is the
read of that result in ipc_task_queue_add_task() safe?

drivers/net/wwan/iosm/iosm_ipc_task_queue.c:ipc_task_queue_add_task() {
    ...
		if (wait) {
			wait_for_completion(&completion);
			result = ipc_task->args[pos].response;
		}
    ...
}

This reads args[pos] without q_lock and without checking that the slot
still belongs to this caller.

ipc_task_queue_handler() calls complete(), clears the entry and moves
q_rpos past pos right away:

		if (args->completion)
			complete(args->completion);
		...
		q_rpos = (q_rpos + 1) % IPC_THREAD_QUEUE_SIZE;
		ipc_task->q_rpos = q_rpos;

So slot pos can be reused before the woken waiter runs. If the ring
wraps, a new producer writes args[pos].response = -1 under q_lock. The
tasklet may then store another callback's result in that slot.

One way this could happen: the queue is nearly full and the tasklet runs
on the waiter's CPU. The tasklet keeps looping in softirq while
IRQ-context producers refill slot pos, and the waiter cannot read its
result in the meantime. Whether this shows up on real systems depends on
load and timing.

If the waiter reads -1, ipc_protocol_msg_send() returns an error even
though the message was sent and rsp_ring[real_index] = &response.

If it reads another task's result, the timeout path clears the wrong
slot.

Either way, a later device reply would call complete() on a returned
stack frame.

The comment in ipc_task_queue_handler() relies on timing ("queue will not
rotate again to ipc_task same element within such short time") rather
than on synchronization.

Would it be more robust to keep the response in caller-owned storage, for
example next to the on-stack completion, instead of re-reading the shared
ring slot?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261127034849.11770-1-davidlwesten%40gmail.com
