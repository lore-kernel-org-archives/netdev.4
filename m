Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795049347;
	b=SqK5eEcLYvJuN9QTKHfAs44sZATTfFJ2uPRxcLlmbGt5UB9eLhV25STF/o/Z2JCjVrae
	 yZqRsRXhktbHH6WP8X0VuSL+AMkUraTkxQU06Hs4Jpz5UVBiDUoHYxrdaBfESLaTdiDo0
	 CJNlHi9Pq1M0pqTU6I+Fm+u6gn7e6VA/hMCTecfRT/lsjLBerfuPpBO7WWqdH1LwmFt4D
	 ms5kK1Bvvu+EzITjmA4L0v0IjkzyofB1RmuPTjKQ8jV62Psb9AVeav01eKzPAx6X/2mUB
	 myyO6QN5Q0iGY9pljlpWThIoyqpFAyNJ5SlTN0UAABIABI6b+TpzEuPoIgTBjzRUjBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795049347;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=S65lyMMR1xE8IrA8zcxyTFGEF6srOPz5FeKYqMApl9g=;
	b=lljyyEZV/As4I0I9Bu3M/P53QxoXUyhiVJqyqHaagz37sEgoSnSspITGTVPegZVfPqhx
	 BFlBHsjrAehGv1nCQIa5GeG2HpGT7QdpmuZhbpWHVH9mCZfy3RdOCUzSE9k4YQchTZZbw
	 d/vEHUIoOVt5Gk2rTXqcfP9lmhu97b6in6NCoPQAcLO81TPJCRx5w1R5AF/J4rpc3uhpd
	 OgoMQr79NaOhgTAZOn9K/I/al3hxZv6eBNWbkLvujuTk9DufBXFeQjZarDZxiHHA0kM6B
	 bCAnH828vjajES/EZs3ehl4I/K3Wnd92qc+dOXK9XNxO3/ZvfELtoO767f8TmodV5Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LnN7GAL+;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=HJehicea;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B58360A2601
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 00:49:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B58360A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LnN7GAL+;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=HJehicea
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795049343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S65lyMMR1xE8IrA8zcxyTFGEF6srOPz5FeKYqMApl9g=;
	b=LnN7GAL+tvi5qBHyNXxxi+Dbpa0jwgIjbrDJYetD5ROdWphqgHscFdgVsMLYGqM/1Wca0V
	weqx0srGfqkU11WylG6xD+1udGJ9rXiJdBlv47uj9PdkHpMLUbDEkMAmf9PIL0rPBEFiXc
	1Gb3L1dtxoZuvMP/3RDPRvr3vpgJM6E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-Pnc4AdPjNEi5fTMpeImDiw-1; Wed, 18 Nov 2026 19:49:00 -0500
X-MC-Unique: Pnc4AdPjNEi5fTMpeImDiw-1
X-Mimecast-MFC-AGG-ID: Pnc4AdPjNEi5fTMpeImDiw_1795049339
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a204f135ffso8888285e9.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 16:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795049339; x=1795654139; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=S65lyMMR1xE8IrA8zcxyTFGEF6srOPz5FeKYqMApl9g=;
        b=HJehiceaKCDXeFC4JNkXjCqGVlH8JdiQ49uzKhDkE76gZMq4YrJEev2Atmq9ggrKMU
         OkrPi0gWJmgFZ2VuPC4D3jTXZx9+ZuIdMv9vCYmEqkQwFqR9tSyqEeDHpqWlorcdzwvi
         OpPFPHr6fxflIWbjBWtG4abQkLPYRt3LQ7GW2IkrraGC+39xxGQWKaMwj1kAxqfgpIdu
         KSkNXNuHsWq1Ni+FwOgPdGE/qTKtmUQoH4KFp4FPle9dLK9h1eLwt+KWGGgvhiCHRiE4
         ERyUww8QwHD5JywAYxswYo2ELIz66cPqr38AGnSkmTn1f2rkvtizkPPOQaHYcqsv/OBF
         7vAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795049339; x=1795654139;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=S65lyMMR1xE8IrA8zcxyTFGEF6srOPz5FeKYqMApl9g=;
        b=UKIZqxaVRdcwxsRIr03BWcSG4r4m2RfOdKTax/qmPx+wF7OoCfpNIADkizLdBjidxr
         yP5V2UmNCeezqG9QOsWOEI78ba3fNttn/d9CjQrCZzSVeOe5lfCjqp1oF81hpi48bT9/
         k+n0/r4zXPIM1GtmDNwwUe+zktwH+SmXESpcbrJyyRL7AgMQa5IyK5/C4kv9Jdct3MmY
         vVMbtp/FfWoN1AbGEQfVA3s8w+1lnMVz3HrJ48C+TzJH0k8XJ62ukIE0x+/6KQdVlK+0
         uUQSIvb1nlry0Ri4bVXJfoWapfUm+sscHZurQf+gChqfk1oZ1sa3xBH+jhZIONUfxzkS
         4bHw==
X-Forwarded-Encrypted: i=1; AL+hErFT9EEZpjVdaBFFuPafEOYm99u+rfe2yoeENQGiQLYfSGo+pBdr0SN5XrgaoEfHMvQV7Qtr7kk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JJYiYQbJPAz+TQ61ybE+xEM652vHpP9oY386TPPHTkzgQR/Hc
	putoEJy8skUxw/4DJJArqJbh2hBQC0JDfUQ3pSGsxi6qdBqTgdXI6GXgzE8UTx2o9i5BRaMcFge
	SHFR4PjryryuMVEJBCC/vDdQc1PMXOihH6qCDPC7nFwoozCeoYA5D1PDwRA==
X-Gm-Gg: AYBFou0ew0oeFCmCTyLYKL+1SZlknU6wyR10j4YeXrWgFB0cXtsxQ9rkBNQ4vBJDYKS
	zYafj1DLO2OAdvzouRIahBFgtD8jqDfIY81Ra7Cgj0avjysVT+Jg3nryPH2Oj0jae/iZyZ4UMp1
	lb0KXXXsthJEpJSKcmUahgs++5QtZt1x3LBRD51etynvhaNQQcVLmXUINHhDukgPRR/FP6ViQJj
	p263rbS7xts0B9QhPcVFQNzhyr/H74QZS8SF3o8B4PIDvEoxO8M3HwDuA0JJMRdkMyGA3ifFaTi
	3XZkqV7DKYauVfG27RLGpc4tYxf398WUmYS2Jzcpb/YE/haKtnH8UGXnOH3J7ZQ2kRz5JPmspxe
	838icQHQqAzfIomUrQTfypaa0NITZrkvbyiw+9TVqj1SC1T8EnLnOR2QPrb7ibKCUOEK/62Byun
	KEA68=
X-Received: by 2002:a05:600c:4ec7:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4bb7da3b3e8mr86398915e9.27.1795049339001;
        Wed, 18 Nov 2026 16:48:59 -0800 (PST)
X-Received: by 2002:a05:600c:4ec7:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4bb7da3b3e8mr86398765e9.27.1795049338658;
        Wed, 18 Nov 2026 16:48:58 -0800 (PST)
Received: from aconole-thinkpadt14gen4.rmtusnh.csb ([216.212.39.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8450fa2csm10795485e9.7.2026.11.18.16.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:48:58 -0800 (PST)
From: Aaron Conole <aconole@redhat.com>
To: Eric Dumazet <edumazet@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,  Jakub Kicinski
 <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Simon Horman
 <horms@kernel.org>,  David Ahern <dsahern@kernel.org>,  Ido Schimmel
 <idosch@nvidia.com>,  Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
  Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,  Xin Long
 <lucien.xin@gmail.com>,  Eelco Chaudron <echaudro@redhat.com>,  Ilya
 Maximets <i.maximets@ovn.org>,  Daniel Borkmann <daniel@iogearbox.net>,
  Justin Iurman <justin.iurman@gmail.com>,  Linus =?utf-8?Q?L=C3=BCssing?=
 <linus.luessing@c0d3.blue>,  Sabrina Dubroca <sd@queasysnail.net>,
  Stefano Brivio <sbrivio@redhat.com>,  Hyunwoo Kim <imv4bel@gmail.com>,
  netdev@vger.kernel.org,  linux-sctp@vger.kernel.org,
  dev@openvswitch.org,  stable@vger.kernel.org
Subject: Re: [PATCH net 1/5] ipv6: gro: limit the number of extension headers
In-Reply-To: <20261113124625.4010206-2-edumazet@kernel.org> (Eric Dumazet's
	message of "Fri, 13 Nov 2026 13:46:21 +0100")
References: <20261113124625.4010206-1-edumazet@kernel.org>
	<20261113124625.4010206-2-edumazet@kernel.org>
Date: Wed, 18 Nov 2026 19:48:54 -0500
Message-ID: <f7tfqwxk5mx.fsf@aconole-thinkpadt14gen4.rmtusnh.csb>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Eric Dumazet <edumazet@kernel.org> writes:

> Hyunwoo Kim reported that a long chain of IPv6 extension headers
> can push the transport header offset of a GRO packet beyond what
> the 16-bit skb->transport_header can store. The truncated offset
> is later used by gro_receive_network_flush() to locate the network
> header of a packet held in the GRO list, leading to an out-of-bounds
> read.
>
> Since commit 3744b0964d52 ("ipv6: Implement limits on extension header
> parsing"), ip6_protocol_deliver_rcu() drops packets carrying more than
> IP6_MAX_EXT_HDRS_CNT extension headers, but ipv6_gro_pull_exthdrs()
> was left unbounded.
>
> There is no point trying to aggregate packets that the stack is going
> to drop anyway if they are locally delivered. Apply the same limit in
> ipv6_gro_pull_exthdrs().
>
> When the limit is hit, @proto still designates an extension header.
> Extension header offloads have no gro_receive() callback, so
> ipv6_gro_receive() takes its existing "goto out" path with flush set,
> and the packet is given to the normal receive path. Local delivery
> drops it with SKB_DROP_REASON_IPV6_TOO_MANY_EXTHDRS, while forwarded
> packets are simply not aggregated.
>
> An extension header being at most 2048 bytes, this bounds a chain
> to 24576 bytes.
>
> Note that offsets can still accumulate over nested encapsulations,
> so the places storing them should be hardened separately.
>
> Fixes: 4b0ebbca3e16 ("net: gro: move L3 flush checks to tcp_gro_receive and udp_gro_receive_segment")
> Cc: stable@vger.kernel.org
> Reported-by: Hyunwoo Kim <imv4bel@gmail.com>
> Link: https://lore.kernel.org/netdev/avTTQNyvwPP6LtGx@v4bel/
> Signed-off-by: Eric Dumazet <edumazet@kernel.org>
> Cc: Daniel Borkmann <daniel@iogearbox.net>
> Cc: David Ahern <dsahern@kernel.org>
> Cc: Ido Schimmel <idosch@nvidia.com>
> ---

Reviewed-by: Aaron Conole <aconole@redhat.com>

