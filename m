Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795067992;
	b=rAR37K9/l+iyF9EWO/yDPQYz50Wgxaos7U9qSmPL3tVYz/nUIA0KiKW1gtN20YkuNdo0
	 49ra/R9vZtnfCM6vJEhfR2CHhk6XH8cwOC2urFdpUCSes0PQ0aFx5Rm+JGSLwiuqOEbVw
	 JQLsZ3oMM6tpaiPSXUOQ+6aKTjdCF3aSrqY74nc6UaPeJo6sb57pkViBVIRQcZKCwDCdy
	 tYoyn4TloMKuY1yOrkjBbzg7UdYSPuez8C7BFoFdKN2zFZzCnX09dMz2lsVqLlr+c3IdA
	 6YRBiCjkhRU9mdqnbhjqmgMHyMoT6jlzgFZ2EvoY3StQKVATCzfZMcL5UIT9MLQbmEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795067992;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=zJJW9ImHGeQI9HkBzIrCR9incErrDrQZ8U5oqxXIi8w=;
	b=EBOtEilDTaMY9Vhho64d5SM7e/Kpj2nqFkmUXYNgIIegeN52cujqCy2lNh4cdnE46NdF
	 Okk2DrOC29FH7CKF12Y4gPUuw+QBO6clRCgC0QcL2/CMIYsvUTZ8gqnOqcGB7hDU+yF63
	 q7cMOryRnwps2wZ+0SIH7osqkx4gxOGSHBKJ7XEmJ9nJFdCzHKvPtad3YSYCNTfUOZ2vC
	 mEZ3vBibAfHTRBf4bqDwVg8tJf5Vwtl0+coodIQGT8k3401FuD4wb8tBTmpCqc8twD2v7
	 R/S2JbzDWlwSNH4K3wGKpHsJ3whXeRKUT6zcCmn7jyQi6pFMLxz3RWTv+94i9WvsXkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tpSCjllo;
	arc=none smtp.remote-ip=91.218.175.35
Received: from mta0.migadu.com (out-35.mta0.migadu.com [91.218.175.35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0309F606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 05:59:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0309F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tpSCjllo
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=zJJW9ImHGeQI9HkBzIrCR9incErrDrQZ8U5oqxXIi8w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795067985; v=1; x=1795672785;
 b=tpSCjlloQ6hcZJFh5lmnsxKaU1HKE9z6Vi8cecHmFQOvJvo5kFhedCRr/9oALIMXLHphJc0b
 hJsdumD9/o4vCZrJ4WUNwmM+iu6+2S3wxzQamVOMaTmnGu+dZ/Nn8myjgKeGqzTnd2WvMIwq0RI
 GxjqTCHgIQFzZMpf1OZvvYL8=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a21f34f1ed7e6d6b;
	Thu, 19 Nov 2026 05:59:45 +0000
X-Mizu-Trace-ID: a21f34f1ed7e6d6b
X-Migadu-Flow: FLOW_OUT
Message-ID: <01a31252-3194-4b2e-9327-f4eeb7a251ea@linux.dev>
Date: Thu, 19 Nov 2026 13:59:39 +0800
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
Subject: Re: [BUG] bpf, sockmap: data left in ingress_msg is dropped without
 moving copied_seq, and TLS RX then warns
To: Kyuwon Cho <kyuwoncho18@gmail.com>,
 John Fastabend <john.fastabend@gmail.com>,
 Jakub Sitnicki <jakub@cloudflare.com>, Jakub Kicinski <kuba@kernel.org>,
 Sabrina Dubroca <sd@queasysnail.net>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Jiayuan Chen <jiayuan.chen@linux.dev>,
 Alexei Starovoitov <ast@kernel.org>, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org
References: <179505708397.3511192.17406955708229395086@gmail.com>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <179505708397.3511192.17406955708229395086@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 11/19/26 11:04 AM, Kyuwon Cho wrote:
> Hi John, Jakub, Jakub, Sabrina,
>
> While testing v7.4-rc3 with an LLM-guided test generator that we are
> developing as a research prototype, we found that setting up TLS RX on
> a TCP socket right after it was removed from a sockmap can find the
> socket's receive queue and copied_seq out of step.
> tls_strp_read_sock() sees tcp_inq() > 0, but tcp_recv_skb() finds no
> skb at copied_seq:

 

Thanks for the report.

We have too many copied_seq bugs in sockmap now, I think we need to rework it.


