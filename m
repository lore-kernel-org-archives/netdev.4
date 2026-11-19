Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079307;
	b=kTieh+kWCN7kwQfqe9XkWXlEwtd9TvuIUSFwCWaXajOwZRxNDiW7nV9kGUzbXV0hh6Sz
	 sn0b0gWZrZIQLiSQ76XVyMm3HZWqD3wDD/g9UVz5iduJOK9bHSdIfVerg5oswdrnOR8Cm
	 lq8I7F9F5l9RLEuCpINbvpvoWS0HBzY6AoW8ebm4ULMYdsqNqJ6Vmc+0g8tGhoAyGfwTx
	 aZMFmLSNg02QlpmIufnQjTquPQorgFtaZ2GpbgI0C/Sjmj+GvNPCMoxMALDhIOiRZhO1L
	 2zPMYrg9gbt7ovj4wIpNSd4ZO6OgALXJ4XGarbDop9rO3tpKrK/lA5RwpgDIlhSPtQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079307;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Kz8J37H4DeouxxnfmLQnTk7ot6ZN48ljpuTfbkjcgec=;
	b=imujKJ6FWy4RhGMkEdnxdc3V/i+rI3FhsAvfEVUUofjgxyiRDGs5uxwFynQmqpzi7hk5
	 wpGJQ+U+PV+RX3gkX+JDY8wxfK8fp4qnqqdaFuT8Rk6JVkVv2KOBQ8CgXKaLBSB+cpoVf
	 pd2kyK9rqk7reXkxOrhYavhAstPel45wa21guKeTYGqxrMsW5+EA18hQ+PohpO2nQfjh6
	 mIpJWE4SQ3390AC1b8wKN8a7rM/AC7kmf+ovOWtTtjre1iClUPmMFpOUnwdIHG09ZuGsj
	 n0uctoVBEYnQ4shSR9t05YGbkM3nzJRf+F2gCIOw0Y3p+A9iXwlLr155f/FW9IS2dHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H7qoftmV;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=d+SxXpfa;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2A9606A326
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 09:08:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F2A9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H7qoftmV;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=d+SxXpfa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795079306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kz8J37H4DeouxxnfmLQnTk7ot6ZN48ljpuTfbkjcgec=;
	b=H7qoftmVOYUKTsufx6gRwd68m8nLY9RaH6MRLDytHI98CFI5VtHe5csou4GqYneEHYdI85
	yRdU1W5IJo81n1qo+KmWabMp+pEQzR8/tOuEp/o/0IRTkm+9qamSEAmzC7260VlxgYlqx/
	eerLGkO2erZoVvpebCKoTgLyHp4/dFw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-350-wLSLfOGhNo2FsM_i_p_NLA-1; Thu, 19 Nov 2026 04:08:24 -0500
X-MC-Unique: wLSLfOGhNo2FsM_i_p_NLA-1
X-Mimecast-MFC-AGG-ID: wLSLfOGhNo2FsM_i_p_NLA_1795079303
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e0ef019a4so1538042f8f.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 01:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795079303; x=1795684103; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kz8J37H4DeouxxnfmLQnTk7ot6ZN48ljpuTfbkjcgec=;
        b=d+SxXpfaGdhxO9wOg2xbT406cBG2QsAycj6YbAWgNPdgWJw7ViLix7V6Aqgotc+Bvv
         YG8CfRZtaCSHDnH/+lypD8eSThLIWOrcSlFBYZUU6n5GHiK3BUKNUmpAYGjv2pjoWJAJ
         IJYzxgxnGruWqUqYa1LA4qBcbwEhVvbsc2YMb3+RinGlB0O6TgQpAJmCh/iThEzXPNMp
         1u/32WZvAWFUWmZjRdvuZRE4MY3+u3Vrb04PIL7SE/mpHy/jgioohmHIJY3lAegYrs03
         hvgQw/KQB2dt99OpKgxo+JsmUX+4iP+gJ4AtOgCDGa5rlnNp7vjQs43T9tbobOwy6ANO
         Mw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795079303; x=1795684103;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kz8J37H4DeouxxnfmLQnTk7ot6ZN48ljpuTfbkjcgec=;
        b=dDSlQ2M43FuL5Fi8DYRLYq/ZwPFLCHLzeRh7m1FCn2jKDV6gIVItcW2o1czzyKIY5p
         kq1OVsjkzVhnyagbEIiN34tyykiKs+TBgi75Jd1F9Q9xmMNeF/CzHIN9orCAS6LFcYsY
         XgvWPNGYdvKEJUdCxrTkC2XySA/eYW+kI121dZOElg+fWRlZBP3qPqOti6wznWGoywYr
         xzno1l6KpJMX7ASE3JoDOA19E2jQ7oFiOVmqNnycO4JrNAt9PcuS6WV1xSZUX4KRojjC
         0TyZ6h3x+QSvb4LFLoVBotI4gxvJ7V3/hikqpTr8cWb6eXStbAYTnMI2AvDb2gwmf2sO
         Ufag==
X-Forwarded-Encrypted: i=1; AL+hErEklS0V9EfTXY8C27TWUpOY6KskjAUMIu2hG1kf3gGP1CB3WLNzKoPsI5zkTxzl+9suaqdS+1M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6oXMXKnQsRPc69Yp61vMbohLPTYoKl/7PwuxEaibfA/j2oP1n
	k5rz53s5HKgx577RntcxS77stG1LoWHIIzRwEyygjDBzvvEGJxdC+oUknVb4YItxVNKUJEJLI9C
	W0Cuj00fJ7fq4nYVk9GweqTdkO1pZzvvXA0sVUp5oC2a4ndvmEonYAa4Bsg==
X-Gm-Gg: AZFdTZcqAjMJCR4kjtDzhV/j2hwRA42po53ENUCESKMEwbP+pIwpq8jm4qlFo7m7JF8
	1mlDXs8nxX8vPKG78Wgz6uG+Kc3FU2cQUh8k55w6AoVPipr0dbWX4b2r5SGo0qnj8LZhvXuJGNv
	lKAjVNjsVG2L6DbecBrvZKPZSNSe7bW9t/APyUhl1zY8VaIX3U65GS21ziFpXbq5VZXTv/UCjvL
	QNd+Eut0iRnk4j/ezhT5Vmwcb3lMij2tcMKszASL3Iyxti+OQlqQR5N7bKsFsVylPdvoA6sH2yW
	LvA5Zma4WlAovpDem6uE/1To9XLGstUO3muqW64/yXltu42pt61f0TTpmwFfpOH3pXYcAZu3o2c
	M+oughT1ZukL1jl5sx0u1V3O3+5DYhsILNExQ5WJkQod+ke6yBwS1WJC5NPpncPbyZfqCKPRib7
	uUv/NWItKGd757nLBdXmrQUisOpcUGofjdHxJBp/xfaB9J
X-Received: by 2002:a05:6000:d8a:b0:4a3:a0f:ecf0 with SMTP id ffacd0b85a97d-4a63bdb0aabmr8503546f8f.55.1795079303233;
        Thu, 19 Nov 2026 01:08:23 -0800 (PST)
X-Received: by 2002:a05:6000:d8a:b0:4a3:a0f:ecf0 with SMTP id ffacd0b85a97d-4a63bdb0aabmr8503486f8f.55.1795079302690;
        Thu, 19 Nov 2026 01:08:22 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6575a5c28sm9677805f8f.59.2026.11.19.01.08.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 01:08:22 -0800 (PST)
Message-ID: <9f3269af-64e5-4752-825b-5747cf8ddd86@redhat.com>
Date: Thu, 19 Nov 2026 10:08:20 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 0/4] net/smc: fix the failover cursor switch and wrap
 rollover
To: hexlabsecurity@proton.me, Dust Li <dust.li@linux.alibaba.com>,
 Mahanta Jambigi <mjambigi@linux.ibm.com>,
 "D. Wythe" <alibuda@linux.alibaba.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Sidraya Jayagond <sidraya@linux.ibm.com>
Cc: Guangguan Wang <guangguan.wang@linux.alibaba.com>,
 Tony Lu <tonylu@linux.alibaba.com>, netdev@vger.kernel.org,
 Wenjia Zhang <wenjia@linux.ibm.com>, Ursula Braun <ubraun@linux.ibm.com>,
 Hidayath Khan <hidayath@linux.ibm.com>, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Wen Gu <guwen@linux.alibaba.com>, Stefan Raspl <raspl@linux.ibm.com>,
 linux-rdma@vger.kernel.org
References: <20261113-b4-disp-1a9ab9b0-v1-0-4a7c8d85d849@proton.me>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261113-b4-disp-1a9ab9b0-v1-0-4a7c8d85d849@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/14/26 05:14, Bryam Vargas via B4 Relay wrote:
> smc_switch_cursor() runs at SMC-R link failover under send_lock only,
> while smc_cdc_tx_handler() and the rx path update the same cursors under
> the socket spinlock. Its catch-up orders the peer's consumer cursor
> against local_tx_ctrl_fin with smc_curs_comp(), which misorders two
> cursors across the u16 wrap rollover. The v9 cover of the CDC cursor
> bounds series [1] lists the race against smc_cdc_tx_handler() and the
> rollover as not fixed there; Sashiko's review of v8 [2] reported both.
> The same switch has a third problem: a successful completion on the old
> link handled after the switch still credits bytes that are being resent.
> 
> 1/4 takes the socket spinlock around the switch. 2/4 tags each CDC pend
> with a switch generation and credits a completion only from the current
> generation and never backwards; both checks rely on 1/4's lock. 3/4
> computes the catch-up from the signed cursor distance, bounds it by the
> bytes sent and advances the RMB cursors across wraps; it uses
> smc_curs_sdiff() from 2/4. 4/4 uses the same helper for the urgent mark
> in smc_rx_update_consumer(), which has the same rollover problem.
> 
> Tested in an x86 KVM guest on a v7.4-rc2 KASAN kernel, with net/smc of
> the base below built as a module, over soft-RoCE on a veth pair between
> two network namespaces. Unless noted otherwise the RMB is 16 KiB, the
> send buffer 64 KiB, and the failover is triggered by deleting an rdma
> device. The module had test counters and test-only knobs, named where
> they are used below. Three controls pass with and without the series: a
> failover with no knob, one after 1 GiB with both cursors on the same
> wrap (there the series is 1/4 to 3/4), and an urgent byte on the
> reader's wrap. Leaving out 1/4, either of 2/4's two checks, 3/4 or 4/4
> makes its test fail. No KASAN splat or WARN in any run. On a
> PROVE_LOCKING build of the same kernel, a failover with no knob and the
> first test below give no lockdep report with 1/4 to 3/4 (4/4 takes no
> lock); with the two locks of 1/4 taken in the other order, lockdep
> reports the inversion.
> 
> - Send buffer full. A completion handler held by a knob at its credit
>    decision while a test hook takes the link down on another CPU, and a
>    second knob holding the resend until the application has written: on
>    net the switch runs while the handler is held, sndbuf_space ends 4096
>    over the buffer size, and the application's new data replaces bytes
>    still to be resent; the reader gets wrong data. With 1/4 the switch
>    waits for the socket spinlock and the stream is intact.
> - Two completions on the old link held back by a knob and handed back
>    after the switch, send buffer full, the resend held as above: on net
>    they credit 8192 bytes that are still to be resent, and the reader
>    gets wrong data. With 2/4 they credit nothing.
> - The peer shut down its write side, so the switch moves the link
>    without a rewind; an old-link completion held back by a knob is
>    handed back after one on the new link: on net tx_curs_fin moves back
>    and sndbuf_space ends 4096 over the buffer size. With 2/4 nothing
>    moves.
> - 1 GiB through the RMB, so that at the failover local_tx_ctrl_fin is
>    on wrap 0 and the peer's consumer cursor 12288 bytes behind it on
>    wrap 65535: on net the catch-up runs, sndbuf_space goes 20480 over,
>    an RDMA write is refused (remote access error) and the reader gets EOF
>    65536 bytes short while every send() succeeded. Also on net, with a
>    16 KiB send buffer and one 48 KiB send() after the failover, send()
>    takes 36864 bytes and copies 12288 of them past the end of the send
>    buffer (a test counter; KASAN does not see it, the buffer is
>    page-allocated). With 3/4 there is no catch-up, all data arrives,
>    and send() takes 16384.
> - Old-link completions held back by a knob while the peer reads 24576
>    bytes past local_tx_ctrl_fin, then the failover: on net the catch-up
>    is 8192, 16384 short, and the connection stalls with no write space.
>    With 3/4 it is 24576 and all data arrives.
> - 1 GiB through the RMB with the reader stopped on wrap 65535 and an
>    urgent byte sent so that it lands on wrap 0, no SO_OOBINLINE: on net
>    recv(MSG_OOB) fails with EINVAL, the urgent byte is never consumed,
>    and the sender, which waits for that, sends nothing more (its send()
>    times out with 32768 bytes unsent). With 4/4 the byte is read OOB and
>    the stream is intact.
> 
> The series is on net and does not depend on [1]. Patches 1/4, 2/4 and
> 4/4 apply on top of [1] as they are; 3/4 conflicts with [1] 6/6 in
> smc_switch_cursor(), where 3/4's version replaces 6/6's: 3/4 bounds the
> catch-up by the bytes sent, which is tighter than 6/6's bound,
> tx_curs_prep (by inspection). With [1] alone, [1] 3/6 keeps send()
> inside the send buffer, but the misordered catch-up still runs: it
> advances the cursors by up to tx_curs_prep - tx_curs_fin bytes without
> sending them on the new link and tells the peer they are in its RMB (by
> inspection).
> 
> Not run, by inspection only: a CDC received during the switch (1/4), a
> consumer cursor that is ahead across the rollover (3/4) and one past the
> bytes sent, where 3/4's bound applies. Not run with 1/4: a completion
> handled between the switch's first two cursor copies, which leaves
> tx_curs_sent and the producer cursor out of step; [1] measured that case
> without this series.
> 
> Test patch and logs on request.
> 
> [1] https://lore.kernel.org/all/20261112-b4-disp-0287c16e-v9-0-e5e8fa688177@proton.me/
> [2] https://lore.kernel.org/all/179364387382.3131.13471253186660322977@kernel.org/
SMC maintainers: please have a look.

Thanks,

Paolo

