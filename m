Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795269300;
	b=TTHyWqLxq3FrUjkbXfFaInKit9rcEJAn0jr3NwJmOXL64kXTZlNSWg/6dADux/ETTBkR
	 EN1LbtQ2M8S1RdhsnPYkpriuczi5ybMc5yWoGfv/sYuJDQ7YboIdEvHKm+Jv9U2gw6pR3
	 6HHRydAX3igACeyJ6wcnTunSpq+HL9XxEOdQvP4iwqSzYOv4LR9bRHJoxsw5MUPduCNEj
	 ce9Bdwgl/eMoWFJz9H91o8QPQIe+z+lvFeMuKW0xOLhnHPA6QXTrkNUMROQFseoddTcek
	 RjMlRpGva5cj0RAYWs8GFpsJWafwVydgCTYD3fH0ifYpc2iEOog1iVXulRoWPdt2vcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795269300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=o6e1R9pJx5J2zqmjfXu2sNlGPkkJ2+fTzEycHPhENu0=;
	b=MMmk1POjefuvPAEmKVBOhSnaGjte7oPgBsKQgxhIuBz2Y2XQcU+tkiIvFAupWUrsZwwA
	 wMUVEpjfL5T2HZCTb//Mnqd1KFgbEnURPgnT2+kaQ0yeMH+k3GVMjUGDqHn9ByWGwh8Sd
	 ufD/ujnTb6oDu802AWLXP+yUwq29h9HA1qnmk8UUECSeI66RGA3QBO5G4NbRerj9qMC1l
	 n4XJtowRcER7RrE8/0z2pYwededFfMi4+9B4wyLmay3p/wwoyif9RxMWJEv631phxW9rb
	 DT+ORtr0XDLi3epU6/CCAApf4rBNQLpp1PQy5ek46rnntRxXVN3b773ODxUziYan+9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GuIDRuT9;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A5E606A320
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 13:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45A5E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GuIDRuT9
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c50933bdf4bso433217066b.1
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 05:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795269299; x=1795874099; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o6e1R9pJx5J2zqmjfXu2sNlGPkkJ2+fTzEycHPhENu0=;
        b=GuIDRuT9bizNt9DdLXvIppYJMlQX0SXGlCjRFBkbRMDt/UMNc0r2wGDn/FKcDOH6F1
         yas4miwisDvwpGhZRmIuUY7A1vXO+mh8ZRmQt4XMY+vmAJnTNsyiUjTgLu/osvwiRxt6
         MwpoQlpXp8XudUV1VMzGKImPbAiAMuqpmlkrkzkb3qzPOAeIDY6JA0dXBHce08i8kkq/
         yi0Q6NpEvk4CSI5R7v/cFGpCNaiDQiHxvB1kV+upFjHW1ewKL0uTxMinweNWQOQztkFK
         CrgtX2chTl1kVPfxUsm9k+K8lmiUzZoDAg1vH0H/pbfGaHWEDTNIVaAd3Jd4ptvCqpUl
         ggrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795269299; x=1795874099;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o6e1R9pJx5J2zqmjfXu2sNlGPkkJ2+fTzEycHPhENu0=;
        b=bj8NzA7zodNzYeGHGOnN3SqLZicAKXT3u3Gxqg+0yEi7n9Oggri6HMenfpOeJGYmEI
         cJTBitN6NsFJcYCJVF/sye8/ifla3pQAyactbzo7sXK4rAmSJYPF21u1b9FYRC5y84/u
         mkqcUKFohvgA1n2xf05ktqM2ByMNCTioYoZjIAcJugiaE3XFlXI8xEWVaB0opkEgHDFo
         YgeeyCmMNkD59008crDctL6RFt+aDP9oFLl2q3hcYnj2nyK/m/qrtQpVE3dL+8RKWR2j
         JnLcwUlDFbSJMEU7LTq2msg873qbTglAUfPv4RueV3HwSPFTA9FkRSUuLRQvvGj5jUJZ
         bVmg==
X-Gm-Message-State: APuU4Z+t5DXWfnxcYI5H7BPvatoGIpMRow3wPgSCpHSbBzwsmbDc6Awc
	/SYZbxIdg9peIpkoefBK2HT2FALNPZPU+rGNqUNv89QBJTAQ7Ch1mfgW
X-Gm-Gg: AZFdTZePFhWYMwT/LmjuTmU8Mgm1oq4UD0as/t7XJ33QT4arP0M8BlzFRduXRRxXhrx
	j+Jfqc4l5qrdh7vftkZv12cEGkcqqfWaH/uzjL3NUydj8ozDfp5e+6gsVZChWxGyxTBndxm9wUB
	bDDYhibTeyTFmrToJvmG1yuH2vY4vyLzOSgOjthOXEPs700wBlrwYoM87Icc5jnPaZyTb8nSbYP
	mcBthNz310OjpiCPdttMeuT1GXcp1HY0LIGjnpaGLDWdThAWzIUJRolFUmMcvLQTWeenQ0xjVQE
	8OrR1oEyrzQDVbKItyUVxE0IhHueS+Bh8pqR37jJUH0CyTcbZI2TgreSMzHaRWspy2sQYgcM9Lr
	zMvwymGp53z49QFBncF1X58XLoQ8s2y0nEYTcCJgI0L3w8YFcBppfgO2BYT4KrGPeiqVbpwtrFR
	KGHHRiZ6F2g5QRyWc2fpOh55kp0a3r8+5VshvMoK6+IvB/o40DFAwzpNavMCptZz7zMOzt5atL3
	JYVi39zfz5VBXxjGFoFB4KZi9B1BeQvosxWuV4P419el9pCe/ttNzBq+a9yDMcPVyL2vV+orHY3
	JknZE1rPRjE/trYUFtAOxz7Jo8+9xMzgRLxJ04aS2XWYXsEQOV5Ikby7nq19GVQV40WOnxwpDUB
	LzZut3Wo=
X-Received: by 2002:a17:907:3f18:b0:c46:9711:e30e with SMTP id a640c23a62f3a-c5131a1601amr662221266b.29.1795269298530;
        Sat, 21 Nov 2026 05:54:58 -0800 (PST)
Received: from ?IPV6:2a02:a03f:a75e:9a00:3fc0:359d:ccea:ff00? ([2a02:a03f:a75e:9a00:3fc0:359d:ccea:ff00])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe25asm197197666b.11.2026.11.21.05.54.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 05:54:58 -0800 (PST)
Message-ID: <7e916e9e-8305-4842-9132-d380d9b6e4ce@gmail.com>
Date: Sat, 21 Nov 2026 14:54:57 +0100
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
Subject: Re: [PATCH net 2/2] seg6: drop the packet if no outer source address
 is available
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 Stefano Salsano <stefano.salsano@uniroma2.it>,
 Hangbin Liu <hangbin.liu@linux.dev>, Andrea Mayer <andrea@common-net.org>
References: <20261115000047.14669-1-justin.iurman@gmail.com>
 <20261115000047.14669-3-justin.iurman@gmail.com>
 <20261118031208.38cbdb5e2c4183da17904095@uniroma2.it>
Content-Language: en-US
From: Justin Iurman <justin.iurman@gmail.com>
In-Reply-To: <20261118031208.38cbdb5e2c4183da17904095@uniroma2.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/18/26 03:12, Andrea Mayer wrote:
> On Sun, Nov 15, 2026 at 01:00:47AM +0100, Justin Iurman wrote:
>> When no tunnel source is configured, set_tun_src() ignores the return
>> value of ipv6_dev_get_saddr(). On failure, the source address of the
>> freshly pushed outer header is never written, so the packet is sent
>> with whatever stale bytes were in the skb headroom.
>>
>> Return the error from set_tun_src() and drop the packet; all callers
>> of the encap functions already handle their errors.
>>
>> Fixes: 6c8702c60b88 ("ipv6: sr: add support for SRH encapsulation and injection with lwtunnels")
>> Signed-off-by: Justin Iurman <justin.iurman@gmail.com>
>> [snip]
> 
> Hi Justin,
> 
> the overall fix looks good. The Sashiko review makes a good point about
> the BPF callers. They do not drop the packet, they return the error to
> the program. If the program ignores it, the packet can still go out with
> stale headroom bytes as the source address, and now a wrong payload_len
> too.
> 
> It makes sense to select the source before skb_cow_head(), as the review
> suggests. On failure the encap returns before touching the packet. The
> source goes into a local address, then into the header where
> set_tun_src() writes it today. That is before the HMAC push, since the
> HMAC covers the source. For example, in __seg6_do_srh_encap():
> 
> 	struct in6_addr saddr;
> 	...
> 	err = set_tun_src(net, dev, &osrh->segments[osrh->first_segment],
> 			  &saddr, route_tunsrc);
> 	if (unlikely(err))
> 		return err;
> 
> 	err = skb_cow_head(skb, ...);
> 	...
> 	hdr->saddr = saddr;
> 
> seg6_do_srh_encap_red() has the same two call sites, the skip_srh path
> and the slow path. Both would use the source resolved once at the top.
> 
> Also, a local sender now gets EADDRNOTAVAIL from sendto(), where before
> the send succeeded. Might be worth a line in the commit message, with
> the reproduction you already gave the bot.
> 
> WDYT?
> 
> Thanks,
> Andrea

Agreed, I'll take care of this ASAP.

pw-bot: cr
