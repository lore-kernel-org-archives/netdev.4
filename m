Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795043422;
	b=bBLEiUDtvT+CzxyKVSYEEvtlosQwORC5U9p6b6iuaScrmkoXgOf/erui00bcznD9a8Rl
	 ORD9uI+FvFKPNXgo9j1hKi35tKiPAQ4EQctVOZuxbCn5kmlqXEMt+OHvl+pg6IJSCWTqo
	 ga7B8JFQjsMHkoyrf7Rex+u4D/QUSfDvfL6wfrhaNYgZXrTys+6Ntlirh8mqeUTj9nkYa
	 Cog1e/xhXZ5vN3FCycaxI1/qjoO7Sqawka/f6d5u4QaA/18m+PpppwKAyNk+U5oy8CdB3
	 IH6s9SWwPEM/aP5h9v/HcHxl+p67PUt/O5LBUiOkztvfbtCdD88GzKIv8BFFsWLXAiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=anu/2F6mroicCWt3l+8C2jxZSamPe+b0q+OPEpgFtcQ=;
	b=Ze4vkqSVhsFpQLGTbnqBDVhHNecBkS4LNd5ORP5n0tkTv558PMCtb/nwscKtB0OVBm7w
	 wMJHUN+SQJ/JzhPGRdLIgbG2xB6HyWgmcehOuDjRK/Gtxy1CLDMkiHSmxifTdD9gxx8BH
	 GfMoqxrOMFycPbr7aXx+VmsfsXZYKfPe1Xe1DZajdvjLG+XQsoTMKGEO4cNHWezhsmd2x
	 tkVUQA85Nx6WCQQm5LbTu9qV02LKRIiCxLN5dQj9cyAeJH6LNsN0iu9Wfs0de7JprOmKh
	 16K+OTT3PgjTwI0cNc9PJpg38o4rggI9cXqWV+8IFBzGZ/uhbxJyLCohdpP+ki6Lwig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u3c790lN;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED56F606A940
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 23:10:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED56F606A940
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u3c790lN
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5361e313e63so17944091cf.3
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 15:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795043421; x=1795648221; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=anu/2F6mroicCWt3l+8C2jxZSamPe+b0q+OPEpgFtcQ=;
        b=u3c790lNESfkSxN3vUZxQRKuXR8a5cILECSs7EkIcK99ceeCRYuvkXg2msD0CTAvdl
         z1cE+3EXT+QqQEjiBiPmSQnDBy2Nils6YIj9rFvkSOXhVFelkN1reL/3nMLD5SdBILA8
         +HiHz8MBI8OTC1hl7M9KRHTBAqjkXH2EfwdIQ1htAE+MBHjFMWIz0BIoevTMTrZNtlgc
         qz5OYLAmxn7JGc8Yw4T/42H2tuiEo8Qu8L/wTIfBaQx6V5ngrx6EEcHShbkpVeC77zde
         jVtTIB8y3GlQax60J9GDzHvjE71u9X8L/ryQ2UF4pFPVVmB2GeXHxCJ+qyHlN/GYui5L
         Gugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795043421; x=1795648221;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=anu/2F6mroicCWt3l+8C2jxZSamPe+b0q+OPEpgFtcQ=;
        b=18qUyZd4l3I/yXz8zwTl8c5ak2gMeEZkPWkwsZmgfa9H8IGImMNycvVnWyr8EI/w75
         T5lf6eCsiIoIwvM9l//CEqPTwD3TLagGQouNaF4iuWBQKE5YbxErfZ5t6sZmhtA0u9et
         BfwVJsAiEUS9aLokEw9FukfK/rW41blMMRAJGxlnAiuN7/W2eMD5UmtEQUCbRkxCbSBy
         OZR2xWZt5llc7WaEkZQlKejLuwP6p7uSIPcMP/FYeS9eXcbHqEkKXsXN7djGn86/jW1v
         YutNxuHKyYA53mhayRTUeSzmqvlRI9KLguD3BQiXB0Oe4nXpZj1tBEyx5YKvb3Plbhpx
         su+Q==
X-Forwarded-Encrypted: i=1; AL+hErF2+XicMExrvP7U4P8gt2LSsPSqY007xvRP4nCFH56EJWs/l0jOGr91Q4EJM/YWlJmDB488Nlk=@vger.kernel.org
X-Gm-Message-State: APuU4Z868a5EXhvSZnNT6ZOHQjv1BUpnLY/xtzN4l++PWmIvxN2TUNbp
	kt4YY8h+JGT3z9ywoqS72LGuJrmN2FNYLf3D8e9lB05zvbHpfggUQIAetvmbYg==
X-Gm-Gg: AYBFou0SZYfzYntDKCkTR1qgn65nWoD7LDheoOpDBcq13yMcX5tZtLWJKJEwNMBi2IN
	uupFM13dlsi8VHPy9TXRwn9M7yoyrfFuIu39MzC+JjGTAEVVtshJRVxiA4ziXqJl4v2mfktxJ2p
	36K/y31XVZi2NqB6fKcD1sGtZtyxqYjF0ZIXaB3UOuMgwBza/Bkw4vDM+n3EB61YpGo62u5mn95
	h/WvTc+XxXmdNzv02eSoMg5Mf1vKxHbN7gS2Dv3uFhpKMaf9lEIQKFxhOQlQGcjdrBh9FDLPnQ/
	xyqA8/K2br7q2DRkanARgXveqCSINChCPA27BkQTpxI4rQliKxWjPUS2pJMHUuT/9RgWfW/smOU
	lN/uhuiikQoFl+jIhOiZoXWZMCpyOo6EZhfjqb8pT6mia1xl/b2J4pZhpPs3yeE4vkxt+wYtiRI
	1dJFIzIQ3lA8CyIEvkxMeT+lnAtcdjK2tNR2RKctApTkqkqjopEFQ4wy2v/Y5v7lHEEnMrJKjQf
	1o2xJEW9FTSGvZrJ0xRgQfHECU7yLXkXjLu7ePLxHt5vzNUyFQIFzZyzSX0PfqSijGa8NWhUmkW
	XmizefZzk2kD8TKt7Ds14bZ1C00nW7Xa8q1LXeYqOhRyWH1CEcomzGoJ1r3M37Rka6pKPffIKmX
	68330CmKJ0CQh1fvm0C66dZfFxXwLtemo8fEtX5/Cu6S4emZqGJBDsep3qT1iuR0=
X-Received: by 2002:a05:622a:5c10:b0:55d:3201:3083 with SMTP id d75a77b69052e-55d5a57f044mr66912361cf.26.1795043420721;
        Wed, 18 Nov 2026 15:10:20 -0800 (PST)
Received: from gmail.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66b24b0asm10772451cf.9.2026.11.18.15.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:10:20 -0800 (PST)
Date: Wed, 18 Nov 2026 18:10:19 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jingxuan Xie <jingxuanxie@deeproute.ai>, 
 netdev@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 =?UTF-8?B?6Z+p5bCR6Ziz?= <shaoyanghan@deeproute.ai>, 
 "David S . Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 linux-kernel@vger.kernel.org
Message-ID: <willemdebruijn.kernel.342e1ca56d449@gmail.com>
In-Reply-To: <20261118135443.24767-1-jingxuanxie@deeproute.ai>
References: <20261118135443.24767-1-jingxuanxie@deeproute.ai>
Subject: Re: [PATCH net v6] af_packet: avoid waiting for TPACKET_V3 copies at
 retirement
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Jingxuan Xie wrote:
> TPACKET_V3 retires a full or expired block while holding
> sk_receive_queue.lock. prb_retire_current_block() takes
> blk_fill_in_prog_lock for write to wait for in-flight skb_copy_bits()
> before publishing the block.
> 
> On PREEMPT_RT a read lock can be held by a task that has been
> preempted or is running on another CPU. The packet path or the
> retirement timer then blocks on the write lock while holding
> sk_receive_queue.lock, and the receive path resumes only after the
> copy completes. This was observed as a receive stall of hundreds of
> milliseconds in a PREEMPT_RT deployment; manual inspection found the
> same unconditional write_lock() in both the full-block and the timer
> retirement paths.
> 
> Try to take the write lock without blocking on PREEMPT_RT. If a copy
> is still in progress, leave the current block and its metadata
> untouched:
> 
> - the retirement timer re-arms itself and retries after the configured
>   interval;
> 
> - packet allocation returns NULL, so tpacket_rcv() drops this capture
>   record and accounts it in tp_drops, while the original packet remains
>   in the network stack;
> 
> - a later packet can retire the block once the copier has finished.
> 
> Do not dispatch the next block while the current block is still open.
> The existing lock order and completion ordering are preserved, and no
> new state or worker is introduced. The trade-off is a higher capture
> drop rate while a copy is in progress; original traffic is unaffected.
> 
> Non-PREEMPT_RT kernels keep the unconditional write_lock(): there
> read_lock() disables preemption, so the writer only waits for the copy
> to finish, not for a scheduled-out task to run again.
> 
> The stall was reproduced on QEMU arm64 SMP PREEMPT_RT by delaying a
> copier after frame reservation: without this change the next sender
> blocks until the copier is released, with this change only that
> capture record is dropped.
> 
> Fixes: 632ca50f2cbd ("af_packet: TPACKET_V3: replace busy-wait loop")
> Signed-off-by: Jingxuan Xie <jingxuanxie@deeproute.ai>

Reviewed-by: Willem de Bruijn <willemb@google.com>
