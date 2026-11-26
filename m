Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.126
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795694585;
	b=SJWBWipICVjPAvxSXH0oDH/e861juhFJmk9ujloFBSn6JTt11IB3GcQz9UNLofutsqA1
	 5ihJ+FfxAyB8o/TvGkj9o6wmu6mm9FcFzUWMdHV82e9h1C7ZB+tCIsWe8fJpC5Q1JC+QM
	 nerHNA/Q6jwXUiJKtoiJw4IrPtEaikyYzENvfeQY4IMxpDFA/4uafzA3b+ZoImlfVdDE8
	 5ZL9kvPUoLJy60Izq8nETFOif7UrEeMNiMXYjwSQBrxd/I8RBEiovw0NUaJngMWREfFiC
	 NC9OyLeSaxWw9/Yc1j6M0CcqXXolyAdkFLibDeJHcyQNrfBK6JHQqJBaGt7eNNkzFPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795694585;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qoA088dkvLhrSXa5HLwvBJYzOxS+97oQxq1vAdRFubo=;
	b=11BrqzpUZAwyc1Me/Dt6KkljiK6Zvq7I6DGiEGpwciH2J9LjJFma3oK9ynDzrIqm/LtV
	 vpZYngVJuX8CZS1txIgghfgKydb+hhcXvDteCanYGClQwwyjARVsQZ0rmLVSwPGcXKhmT
	 +1bobwgvfUy0b4YReL57nYykNubWYIhDs2JWl7YaAOJQ4VpcMN+g2rLxdnpK0DG6VRGuy
	 HJfxmY9ySTJxM1nSM37hnMjZa3IsAoE/y1dr5902Blw8aI9/qyN/dZz4AdBdLaJ29GAte
	 LvoaLtrpttnss46no9HQCvcipULWxw385FpfCDhW+vr5X08MY3WxS/cW2UGammrFq8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HyMa7aTX;
	arc=none smtp.remote-ip=95.215.58.126
Received: from mta1.migadu.com (out-126.mta1.migadu.com [95.215.58.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0770606A32E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 12:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0770606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HyMa7aTX
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qpihMKwKeEshqRGiOU+LJxx2L01+RYwZPY1UI4N9uQ4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795694583; v=1; x=1796299383;
 b=HyMa7aTXe/NrTr9HLhd00TRaFsn7aIF5jCJgwtdB5x8XflIfc9C69TtPBrpMrf4tYEWfvyIv
 W/Fi9bdlGnpQGspXPlEowfjErVYOIFbZepprLKET93X2Clmh1yu1hMce8zXZv0Cc3dDODqbNWKg
 zi7lm33+fUzDqGlf244w100I=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bff048c27b98143b;
	Thu, 26 Nov 2026 12:03:02 +0000
X-Mizu-Trace-ID: bff048c27b98143b
X-Migadu-Flow: FLOW_OUT
Message-ID: <eb8abbc0-3028-4bd6-9010-0a855305e294@linux.dev>
Date: Thu, 26 Nov 2026 20:02:54 +0800
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
Subject: Re: [PATCH bpf v2 1/2] bpf, lsm: fix bpf_setsockopt() on a half set
 up child in inet_csk_clone
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: bpf@vger.kernel.org, kpsingh@kernel.org, matt@bobrowski.net,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>, Stanislav Fomichev
 <sdf@fomichev.me>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Xu Kuohai <xukuohai@huawei.com>,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20261125070330.16625-1-jiayuan.chen@linux.dev>
 <awcUm4PvuYb3nGxM@devvm16445.scu0.facebook.com>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <awcUm4PvuYb3nGxM@devvm16445.scu0.facebook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/26/26 1:04 AM, Stanislav Fomichev wrote:
> On 11/25, Jiayuan Chen wrote:
>> security_inet_csk_clone() is called at the end of inet_csk_clone_lock().
>> The child is locked, which is why the hook is in
>> bpf_lsm_locked_sockopt_hooks, but it is not set up yet:
>> icsk->icsk_ca_ops and the ipv6_pinfo still point to the ones of the
>> listener, and the timers are not initialized.
>>
>> So bpf_setsockopt() from a lsm_cgroup prog is wrong there for:
>>
>>  - TCP_CONGESTION: puts icsk->icsk_ca_ops, which the child holds no
>>    reference on.
>>  - IPV6_TCLASS: writes to the ipv6_pinfo of the listener.
>>  - SO_KEEPALIVE, TCP_KEEPIDLE: arm the keepalive timer before
>>    tcp_init_xmit_timers() sets it up.
>>
>> Options considered:
>>  1. Remove the hook from bpf_lsm_locked_sockopt_hooks, as commit
>>     5416c9aea832 ("bpf: Fix the kernel crash caused by bpf_setsockopt().")
>>     did for socket_sock_rcv_skb. Not done, setting options like
>>     SO_PRIORITY on the child is what the hook is used for and it works.
> 
> [..]
> 
>>  2. Make these options work. This needs the child set up before the
>>     hook, too much for a fix.
> 
> What is too much? Moving security_inet_csk_clone to happen at the end of
> tcp_create_openreq_child? Or is it more involved?

It is more involved. The end of tcp_create_openreq_child() only fixes
the timers. icsk_ca_ops is set by tcp_ca_openreq_child() and pinet6 is
switched in tcp_v6_syn_recv_sock(), both after
tcp_create_openreq_child() returns. For MPTCP, subflow->conn is set
even later, in subflow_syn_recv_sock().


