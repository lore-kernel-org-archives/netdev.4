Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795512113;
	b=E0L/nfRne+RtS+RNkEpHxzUzCLFPgtGuNNE3d/1SWi+Eh6Cs7jXCC/cJn+HHU+KvskMH
	 a/0ZJrIQGIqUZI1zAbR+LWgdQu9YOJIrIgQ1lBJEOV3IN9iZla6w7wwBB5EyymZLWufSX
	 BozZI4cmY1SftOuvnN2K08Lq1F6qsrR/vq/h77akmdSzzYj5teBZd0YcG/3xca6XOoLwn
	 nqGYbMFRPspkEZx9SyywndtS6zdzq8x/M9Hryz1ynsIYCyrxa4KLqNeVhiARidsiKOrRx
	 QtbYFYYtb9Jex0mo1an5NP3Ecnnmzkr0hwgvPqAObj4lop1K3uUwwMFAIVbT/cE+xsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795512113;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ywL9EPsHehRIzLitHEixcM3pOk5E4q1NJt9LmnwsW2U=;
	b=OCyGaKbQMdiY1LVq35EwPnCeAGazXxl2zNtA7CYFw4DC2jxBTJHAE+YrpY/7A/FOdk//
	 kmdh2SSjgCVcY4/ddMzd8aCc47wpFwUOcBE4wj3jmIJnN/TUW62AqsTHQeKnYjQUf5wli
	 oWEx+paDy971YWHqD7bruyVkxHtBvNGSjWaI2xe6n1764JTEVkGYtU8faYPTKj11cKqoo
	 SYED4uGXTCKp9UzQOuFnOPjMatRmh4fj4bIxrOmQTqGrjnY1QNbd5yMGzfuWpDQKFwNcc
	 D/eHyoWR3fIR0MqrZd5TPmsL+lY3sJeOPkny+El81rRapGgEvf6xmWCIF8ijYtVsBeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=AzYFJcNm;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D865606A680
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D865606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=AzYFJcNm
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so38749985e9.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 01:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795512103; x=1796116903; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ywL9EPsHehRIzLitHEixcM3pOk5E4q1NJt9LmnwsW2U=;
        b=AzYFJcNmHkMQMxnTgMoB0w39NyHvYnavPL4NfjKyItSDiP0vtjkZ2ypvuHW1R4gNfS
         XBzz1U09iqFjjaSrfkF7+/ckf/cuDLRfxa2SF2s8QFFlPi5ay3AOd1sBTCNsLiT3GbRl
         RhvvHRloA4DV8C3QSIgx3WaWU2w2bI/R9Ozx4bKRklxvTsn/IcRj51on9K9EzUTBcxjp
         4t1Bykggq7yOxfNbQQhbUgesF8D9nX26LoaGvuM3hy7B0u2ARR0yoImXv+gS1HdKyMRr
         B0kFe0yrocj5YJm2h4YVH9vSst/CXRn96uPm05DmwxmP8aUbF1MfbfAiULkJX57kaA3A
         sUhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795512103; x=1796116903;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ywL9EPsHehRIzLitHEixcM3pOk5E4q1NJt9LmnwsW2U=;
        b=n3CR5iSDoKBNmLaOs1Y656UwfXqD/iIofB4dkjS+Kx34fvUOJXJkGjaj6NXrKIUN/p
         n5FKm4K7Hzr86tjcq1fHnKcZaxwGWN0XVQ/G1m4kRPAUgbvDfyVsv0xtnw94sBzYUxra
         TyEVIxaQ9O2T1KjyROV/HdgUeQ3IQ20Jn/KERn+1p5xVbIAr9sj5G+Rfzp9BeIAa+66A
         phGYeWpsksCXEqkfIObTwoSltce4CM+u98/174bctVroTTdtetK/SNTTridPajaP1PMe
         jnaRB2mJHE8jE/8t4HRyOcn2k0hRKrKB7OX16NQ2ImZSRqnd2rQvHiyo4g6EC8WQOtui
         M+SA==
X-Gm-Message-State: APuU4Z9RBMmfoF9r7+GKUrxJ8no7Pso6FlL3gk3xy5KLblEPRWawwBXl
	wKZSnM1m8kS0TSmzC2E8NV0s+Yl0rgmIR4iPV6J3ECuajdDrpENZM5MM4UTj+lUMzLQ=
X-Gm-Gg: AZFdTZdHUpNn2JAPLfT+L3CsVKbDDYJMqPmqg5BJORm80/MbhRxDht/6uCw4uG17LyI
	fMX92fISDoJdqDFvfEmQjUrUBbIWkF9MH+L5lLjFB+euD2Ccf1uXvD9Fuk1iJMVBmO7yOUS/Vd+
	wH+eOijx2eoJBzzRKDB5VcNLPLiJpKgZV0Nr+1WNnwuBo1dbxD8cZl8yJbecojYndhuq05iRUpA
	shoSQlOu773Dz2MRKYkI+ysJuGx4diEf/1LtHBcPNGAQy5KzDXxCCLY/dXrUb5Nu9h4HQmWNWE9
	kvVoEOdGYFztwB3NQL5ejxSCEIoek8OiQIw66EqnMALlavMSAOCH/Ryir1drcjLHFa2R3uNpHOC
	Tzt95u9dOHEsbj1EQyx9gerL0ZpvEW6hoRVjC00UQxcK+T4zSWOKafa4luXmw7OvVtUElOX75W8
	o9QVyALyEfrN6J3kC8Hulap/M6KnaXembZRK5uNKnKwcUAY0JUlspPlfAi8n/6OulqCEecbwmZE
	HRm8Ln5gcjpOqwAJS3KnGF5A6cYMf04T91AEBhtysesj7qN+o48Xqj9pezYnshiFesfBIxc3y7A
	Pxk4qOfNOyYNsH7dklz00mKa1X1x98DKHb1DxZvVnHdQ6LvM3qFEDKPW6vI=
X-Received: by 2002:a05:600c:820c:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-4bb887876c0mr311188345e9.0.1795512103403;
        Tue, 24 Nov 2026 01:21:43 -0800 (PST)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm471537685e9.10.2026.11.24.01.21.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 01:21:42 -0800 (PST)
Message-ID: <9a0568ae-2f9d-4a25-9d34-65d1e74dc4fd@blackwall.org>
Date: Tue, 24 Nov 2026 11:21:41 +0200
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
Subject: Re: [PATCH net-next v2 0/2] net: bridge: switchdev state of fdb
 entries made dynamic or roamed
Content-Language: en-US, bg
To: Julius Bairaktaris <julius@bairaktaris.de>,
 Ido Schimmel <idosch@nvidia.com>
Cc: netdev@vger.kernel.org, bridge@lists.linux.dev,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Jesse Brandeburg <jbrandeb@kernel.org>
References: <20261122192118.1204290-1-julius@bairaktaris.de>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20261122192118.1204290-1-julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/11/2026 21:21, Julius Bairaktaris wrote:
> When the user turns an fdb entry that switchdev was told about into one
> added as "master dynamic", the bridge reports neither that change nor
> the entry's later deletion, so drivers keep the entry after the bridge
> dropped it. When the bridge withdraws an entry from a port's driver and
> keeps it, which that change and a learned entry moving to another port
> both do, the entry keeps the offloaded flag, so "bridge fdb show" and
> "bridge fdb flush ... offloaded" treat it as offloaded while nothing
> holds it.
> 
> Patch 1 reports the deletion of such an entry to switchdev before the
> entry becomes one that is not reported, and clears the offloaded flag
> with it. Patch 2 clears the offloaded flag when a learned entry roams,
> right after the deletion is reported to the old port.
> 
> Both were found by an LLM review: patch 1 in a review of the
> series "net: dsa: fix host fdb refcount when an entry roams", patch 2 in
> one of __fdb_update() while patch 1 was reworked after its v1 review.
> 
> Trigger: patch 1, a local user with CAP_NET_ADMIN runs "bridge fdb
> replace <addr> dev <port> master dynamic" (or "... master use") on an
> entry that a switchdev driver offloaded; patch 2, an address learned on
> one bridge port is seen on another, as when a host moves, and the old
> port's driver had offloaded the entry while the new port's does not
> (DSA with assisted learning on the CPU port, entries learned by a
> switch). Shown in QEMU with dsa_loop. Impact: patch 1, the switch keeps
> the entry for the old port after the bridge dropped it; patch 2, a
> wrong "offload" flag in the bridge's view. No crash or memory
> corruption. CVSS 3.1: patch 1 2.3 (AV:L/AC:L/PR:H/UI:N/S:U/C:N/I:L/A:N),
> patch 2 0.0. Until the fix: delete the entry and add it again instead
> of replacing it; the wrong flag of patch 2 goes when the entry ages out.
> 
> In QEMU with KASAN, with dsa_loop given FDB operations and assisted
> learning on the CPU port, and a tc mirred redirect that delivers frames
> to a dsa_loop user port (test-only setup): a static entry on a user
> port replaced by "master dynamic", and an address learned on a veth
> port, which is a host address on the CPU port, replaced by "master
> dynamic" or "master use", are not deleted from the switch and are still
> shown as offloaded without the series, in 3 of 3 boots each. With it,
> each is deleted from the switch and no longer shown as offloaded, in 3
> of 3 boots each. An address learned on the veth port and then on the
> user port is still shown as offloaded with patch 1 alone and not with
> both, in 3 of 3 boots each.
> 
> I used Claude (Anthropic) to help write these patches.
> 
> v2:
> - net-next instead of net, so without the Fixes: tag; the commit that
>    introduced the filter is named in the first paragraph of patch 1
>    (Nikolay).
> - Patch 1 clears the offloaded flag with the withdrawal: a "master
>    static" entry the driver had offloaded kept it after "replace ...
>    master dynamic" deleted the entry from the hardware (Nikolay).
>    br_fdb_offloaded_set() assigns the flag instead of toggling it, so the
>    clear cannot be inverted by a concurrent report.
> - Call br_switchdev_fdb_notify() directly, no helper (Nikolay).
> - Drop the comments in __fdb_update() (Nikolay).
> - New patch 2.
> 
> v1: https://lore.kernel.org/netdev/20261121191638.1724620-1-julius@bairaktaris.de/
> 
> 
> 
> Julius Bairaktaris (2):
>    net: bridge: withdraw the switchdev entry of an fdb entry made dynamic
>    net: bridge: clear the offloaded flag of an fdb entry that roams
> 
>   net/bridge/br_fdb.c | 19 +++++++++++++++++--
>   1 file changed, 17 insertions(+), 2 deletions(-)
> 
> 
> base-commit: eb6d6c80d35449c27471b1874f13066c09a8964d

Hi,
I've been thinking about this and I don't think it really improves the current
situation. The problem is that it introduces new race conditions with the bits.
It fixes one problem and introduces new ones that might be worse.

I'm sorry but I think the fdb flag management (and potentially fdb itself) has
to be designed in a different way to avoid these problems then it will be possible
to fix these issues reliably. I don't think it is worth going after these corner
cases that never worked and risk introducing new race conditions in current fdb
state.

Let's see what others think, too.

Thanks,
  Nik



