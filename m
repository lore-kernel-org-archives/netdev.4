Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794973128;
	b=iNO5fCQBaPuVD03hQi6vcUQ1Cc+SRbPhDnAEFGosgP3jez9jkBFCFZWbkMY7UnNMI5gr
	 1qaXWxKoA4Az1fIL/Pidx4ilkdcAGd5PkMLgRcEh5l20OUdsUH1jX5FGgQyUY+yE9+NAG
	 UfRl6WF6Ef2vBIBDvrtbBeCom+9j8O7quJcysozxzP+F1SbsJwbJBRmbSpHBsplkUIawM
	 96nXOBENF0lVGaah0EDuQWh3214taXVLzxhQSTbwyvUWf8qa/DToZlXaAs75Az2kW9ZS+
	 kYCLi49GyTjzY5+eBIZlCNytaIgYQ8oCP9vl1zIhE4WiHx78NhW302oKrktcz9ajIuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794973128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=Kvmn+xw8fMzfurQj4tJUer/fYr30jKP4x1tcbpp4Ht4=;
	b=QBX71SiG3FBAOZgfQGs10zVw9qy4k5sDa2F+PJH0BMLaHi333PRHmF/xPTZrxgumZSqH
	 01Yy6Qo5IgKs/MLWwxjAe/BAtdDsat+BWYWzRqeTKQZGcC2nSLrZ7VAuaq45KStAcICSL
	 N+HoPBBit1sGJxo+h6FQwW9jtRCztrpOuq/Kh0ch55crcwkfsEBlPjsrl+KCizZFM1TYX
	 OI3NYVSuMuWDTCWepc3/zVCWhOdQaiHIsUs9XaVHd53TxNABVA0m9p7d4A6L+qNTWtGQo
	 EvgSWAEE6JUnWoRVg7vUPWKyK4p/BOLrt627vM70pWUi9FOOMiFDNDUlzSgFwvVP13Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=IfmRfcsh;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB86C606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 03:38:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB86C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=IfmRfcsh
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-380b40319bdso950176eec.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 19:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794973127; x=1795577927; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kvmn+xw8fMzfurQj4tJUer/fYr30jKP4x1tcbpp4Ht4=;
        b=IfmRfcshEf8CC2x8ZQabjNmG5gsCHR8OAyUtXOaUA4Luli9y7mZZBExDxK8bPLb6Zd
         rac2EJ4N6fEvhpBJDmWkpYnWbeIl08HM+7laGQT5cBlru06kB4cFZA9zPjBO34lNREZV
         78QFlxDIg5xGljN2NBs0N5kiQMWyWvSEK4+Dc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794973127; x=1795577927;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kvmn+xw8fMzfurQj4tJUer/fYr30jKP4x1tcbpp4Ht4=;
        b=hh1X+VKA02bUzzoQNMsNbouxvzkGgwc8euTNbQA5szKPmYrrfYECleGRStIEFILTIC
         FULLXdTKw7j7JYzeTsph1wjDUwapi9p/ExnWQ6y2Ku02IvTrfGVa6LHbyTn5XzRLMBSH
         2KChvbNyEQsX+Ng3wTjXK8AB74fJ4kzWlwDmL/EMfjeIFDQXyc9W3Gcn4tUhuVHoJvUU
         wN4jQ93L/xkBQn5Y0FMmobeSEfVZP0/AmaAPCCKSmfFVrN4GQjTfw8XsXbCnzDQvAGYL
         9XD5Mi35e5TvL140okeGPWChFbw195kmkuNhuwyYODcNIvCmZG9sIKrlKY8EZqotjP0n
         qiJA==
X-Forwarded-Encrypted: i=1; AL+hErGhJjZjxelDZNj8haHBU4m2ok6c4vDCigbrl78jj32FAj5XNIjSFoJ9Yrp+7ffh+My6HZ89+24=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kuVp0Z++erO505//XD7b1Q5IyzFZ7xcYmmzSR6B9fUGZnSNvJ
	8VD6Y2R8c2CNCkF4+U2cU9LeEGyKHi/6H7lAc4JmFecSwPyVuZEvWrCBXh/pF6TmhjU=
X-Gm-Gg: AYBFou1fP29Lcwpmz8lL4ZtkxtSApJ+cZBo6dKEVHHAyM1jd3lRB/BBMwgu+6sCluYF
	g0e3UOsGLhq+ucMbgWAbFfRj+FEFV44+cSehncDx9ymzY3V5LaFFqtd+5/lHKl0NHzx4t+rgRfy
	ibEwpik50XBcouUiaogZDHrS6w7Ft7hVDnvdlounag/Rzu0kJTkhXRAwVJUzQ+WUwXrWJVxSDc8
	Fhtya1VrBeet8HbBFdP20KdQ1+C8J48Z+AKNAKOaai82AyoBc9KFE7cln3+HTDS/Ss1LYakaplf
	aS5cl0vGTMOvqpkCMoCSVwxcxe3NC1WTTd629MoSEGz9/onC9Ohq9GDVEt9M4sn+UttnXNXhyfE
	ztMkdpHS91T2ClG2+32Ybk/Yt0qJR+B1oxlt5EtrUv3cM4fBEjkrZOLYOie+Ztgmq3ZmZk/FSbu
	tBSYAj5DMMsAJTr8prm35DxBqDQ6zBLW1tWdl4cF6KdLJtryH5xI2S9Q4/tur6TXTL6bNPpqJZX
	CTK71gj2npl4ctjzyoEs6S+r++cSqPwfoMvgFp/x/I1Pn8ffao/5xIY92pqPa2Tul59HJPHIIDV
	pV8R5Yt8J0g+oghP66sIr/rwt5oqrJpXi4le1jtra2fJhOf6N08ymaqb0VhhR/aPFqQfSCq/wLm
	x3wp7snEA+L5qvZXuPuC2F5xYap+OrGps5Qg+3T/l/TlLG0msZAMa94QQuHnsgUkuwpf5aeib2X
	GwdhteInCP/r0vvlQUc3BLwmtAGad+/hs97O38QnQ5QyjTxuFn0zEPx9x0hzxQ1G8n
X-Received: by 2002:a05:7022:fc01:b0:1b5:1a6c:af64 with SMTP id a92af1059eb24-1b543bcd4b2mr1258863c88.17.1794973126774;
        Tue, 17 Nov 2026 19:38:46 -0800 (PST)
Received: from [172.20.0.2] ([172.56.235.113])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059f8sm4907822eec.9.2026.11.17.19.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 19:38:46 -0800 (PST)
Date: Tue, 17 Nov 2026 19:38:43 -0800
From: Chris Down <chris@chrisdown.name>
To: Alireza Asgari via B4 Relay <devnull+alireza.asgari.net@kernel.org>
Cc: netfilter-devel@vger.kernel.org, linux-mm@kvack.org,
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>, Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>, Shuah Khan <shuah@kernel.org>,
	Tejun Heo <tj@kernel.org>, Vladimir Davydov <vdavydov.dev@gmail.com>,
	Zhang Jiao <zhangjiao2@cmss.chinamobile.com>, Song Hu <husong@kylinos.cn>,
	cgroups@vger.kernel.org, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Alireza Asgari <alireza@asgari.net>
Subject: Re: [PATCH RFC nf-next 0/9] netfilter: nfqueue: account queued memory
	and reserve capacity
In-Reply-To: <20261115-b4-nfqueue-memory-accounting-v1-0-b9cc30819997@asgari.net>
References: <20261115-b4-nfqueue-memory-accounting-v1-0-b9cc30819997@asgari.net>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <av0dwzvTBXXLqWCa@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Alireza,

Alireza Asgari via B4 Relay writes:
>3. Whether the proposed bulk reservation interface is an appropriate MM
>   interface for this use, including the explicit restriction of charged
>   growth to 64-bit kernels. Is this compatibility tradeoff acceptable for
>   the initial interface?

Hmm, I don't think this needs a new interface. obj_cgroup_charge() and
obj_cgroup_uncharge() on the objcg you take at BIND already deal with root
ownership, reparenting and the kmem statistics, which is most of what patch
4 reimplements. They would just need exporting.

>4. Whether non-reclaiming reservation growth is the desired failure policy.

I don't think so. A long-running cgroup usually sits at memory.max, mostly
with page cache, so resizing the queue would fail with ENOMEM even though
most of that memory could be reclaimed.

>Increasing capacity obtains the additional reservation before publishing
>the new limit. Failure leaves the existing configuration intact. Shrinking
>preserves queued packets and retains page-rounded backing for the greater
>of the configured allowance and outstanding saved charges. Excess capacity
>is refunded as entries drain, with refund work serialized against resizing
>and coordinated with queue destruction. Refunds settle the actual memory

Keeping the charge at the larger of the limit and the bytes still queued
makes sense. Otherwise one could shrink a full queue, charge the refund to
another queue, and leave the old packets uncharged. But, unless I'm
mistaken, the excess doesn't have to come back as the queue drains.
Configuration already runs under the nfnl subsystem mutex, so if the excess
is released at the next configuration change or when the queue is
destroyed, it looks like mem_work, mem_mutex and mem_stopping can all go.

Thanks!

Chris
