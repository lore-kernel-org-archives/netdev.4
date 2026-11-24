Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529165;
	b=nU7M4dblK2lsrGvfyVunBwOraXoU5Ep2leHraRX/jJgi16iNTu8jd2NzmZlNrojrr69J
	 8egN9EP/9FTny1h9AySBDrGgRjTByGNHAAnaRSSxJZzfbI4GP5erlwKU4Mn+4LPageHxE
	 UMLwmtbV9EOweXwH2K2FNGaHkLnnAmzA4iyZeVzl4CWidP2b5yJ/vatusXHjPTYd6kgcV
	 UM70hfG+DQzau8TOyvQSxs7Ootc2UfmQpa3TQNHut9KegUvRNKRL9pc/Qp2VQUp52IO4S
	 Ro8lc7BqpUwsdWC5A2MxPbwvLTIkZIrOLczdjrF2Crsgk+2O/1b0jZvx1rBnifdgv2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529165;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=J7h23mJqn1H2fN7GPoj07XLNna4GZEHqoI76yphfwDs=;
	b=h0XGJX+A8nOg+dqpRUnfKUGiKBsJhGIUOVGAKyakw3eQ3aSrEk9LhXKxGRzltaau3SL3
	 /id12e2Nxgn2SUOIMiuSbzHOmjhhqFoUDjsJ7PpvSgnzhPwapjcAmEaJYA7zics8QzJUe
	 jcddCG+T+eV2KWrSazmS7CLpyEWHXUeXcDy0SZxMCP4/DY2AfmIRAqsyWHIwmIc8YEy7X
	 mP1WIgbMm83CHu4BhE4ObpzeXj3gNbFjfMHdlvNndTdS6OHePaCwSXbY/CB4Qs163OeMf
	 s7w/9cGQ3DYjRYtKLlld8+z3uYyuCz9Mb3xTi57s02LGSgQriijXt3siTPIBDrL3dZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aMmtkkTh;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=QV1dkshK;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DF36078483
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 14:06:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4DF36078483
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aMmtkkTh;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=QV1dkshK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795529163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J7h23mJqn1H2fN7GPoj07XLNna4GZEHqoI76yphfwDs=;
	b=aMmtkkThe0H++jDkwNTYQthAHDGGqM1YUnGv2chsLgS/47+k2f/E8kJehjXPlm/7a8qpKe
	9WuE/tVRIhES9SmJDSqpQmGVU6JQNSDit4aFYubd9qhcozYqr+O+MQdkYKYJFhVQPYldOh
	sC034YH6+8pL33kd5FCzQ8b4be7inog=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-6-81o_4fmBPFST8MuXifgdSQ-1; Tue, 24 Nov 2026 14:06:01 +0000
X-MC-Unique: 81o_4fmBPFST8MuXifgdSQ-1
X-Mimecast-MFC-AGG-ID: 81o_4fmBPFST8MuXifgdSQ_1795529160
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c505eecba6cso384391366b.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 06:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795529160; x=1796133960; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J7h23mJqn1H2fN7GPoj07XLNna4GZEHqoI76yphfwDs=;
        b=QV1dkshKQmoZAXT4/b6jEf1+VHm0vo9NLdqA62AlH/1HVCp5u1FiqXbAO/7eXLGYUB
         vNKev4r0W+L60QneMmiYBNZLk8uRECWACuSh9wig743lrjHStt8trIr3X+RypvfHbYDZ
         Gnd9jhH84JkmUq1AdkTk5GCqrFglZNdB8oxbCDUuMTxhhqdYZ7G7JP8VGQeSX49hTVh1
         r6QY2nDOxV/gsTI4cQdjLQkHECg0+eCpJJc9LgsUvoVCSI2JRF/fEvjG4XyOjWSEiAvC
         Qpv/ag6O29sOn6ZV4jILUm5ukKAtc7IPvwGvQ2zbxfVNvh46gdS1dF4imrOm81wgTIYS
         W96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795529160; x=1796133960;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J7h23mJqn1H2fN7GPoj07XLNna4GZEHqoI76yphfwDs=;
        b=qeH4azgzPRYauyIrDH2mbeLfeLhMz3J4Zaps+S8BqhWGnfaKPbmGnC6iNC7tHH3Qxb
         Qrr8QQVUl5hOCczRoC722gsHiWXk+LvH/YVsvOS8x7zccG0UAX5rGosFH/aOzSk8has+
         oLczpxIGLEfXEWWee25YxGnLFM1GNPgs85+dXr+pMj6Yz49gjIZ+bEJlWbOnJ0SFUfWT
         w6rXnNThiMLZKO8IAVoOL/keQQk3U+euQq7CdLbOzhuhGn6elDPDjsW3urJOeB5CVwKc
         7e3CHFMEp5FJMZDab4odSOx23zHqhqDk+cRTUYlrAM5VaCLcLyM2fBuiZWupRiBYjx25
         yPbw==
X-Forwarded-Encrypted: i=1; AL+hErGfWT4JKGeQrKrzXfxWXS34OvJPreY/L2ufeVS89CrX2m4LPIwLLWJ/BDK+rEaS8PS6cyyKPuM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qFu5l1vbGXcWzgdkg3Jez+uNCK6vF0SCnbRWCqqctmGJSyxVN
	ieysQE7xVF3toEUn03Boy9SyTkfEZy5lCpPHC8RCw3d1zRNWegTqWbU8ajw65SsWHsRkt0cABCz
	yJBoM8g6SDyM8rBijewDdrnySn5C8eQ2Z4tRBV6j4RhWJOL+HVmopXA0skQ==
X-Gm-Gg: AZFdTZd7YaKBS4a/5H2Vg1dvQBgNsCTQSawqe/EozCdVvNzhKyIQvVpQt5XnErGDRJE
	GVuYr4+8iLHqzthW/Mu6+gJM+MqPgx9Xql9cGssx42SkP9hzX+wQoJKH8+UpMWyoqxGINdQSv6r
	ZnOLUrUiOaTrV1yvFsQDXp+VkXsUnLA2YVPodkQNnn4qV8N8k+zAfgB8qpgD0YK9gHtO+Zs5huU
	aDHVeHBUcOdO7aFAXQUdsCzkIlZBFKMA21+nkfZb9+YMUsCsNkyqqcXntGDKSRy9TOhJKN8bCBY
	furaSA4AwdehaEji8jI/2IgPIhyBYubGbtx9eIm6FjfqsifAt7z3GInJHzbrdyH2TuohXzHg97W
	dNRa1yIyFJZIYXYYJt3Viycz+9sPm8iXpFsQCXcs50Y3NDEbU8nPW/awJdPLU4oDq2f6SPM5vSP
	v3ODiKcy2WQCGo2Ib92kGGzvXKjqnqssj8jqqXw/rLYqbZ
X-Received: by 2002:a17:907:7b9b:b0:c4d:3208:5781 with SMTP id a640c23a62f3a-c513a4b1c1fmr1311675366b.1.1795529160193;
        Tue, 24 Nov 2026 06:06:00 -0800 (PST)
X-Received: by 2002:a17:907:7b9b:b0:c4d:3208:5781 with SMTP id a640c23a62f3a-c513a4b1c1fmr1311671866b.1.1795529159769;
        Tue, 24 Nov 2026 06:05:59 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc2455sm517585666b.57.2026.11.24.06.05.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 06:05:59 -0800 (PST)
Message-ID: <34de8380-f2ea-42e2-87ff-97a52ec3200d@redhat.com>
Date: Tue, 24 Nov 2026 15:05:57 +0100
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
Subject: Re: [PATCH net] net/sched: sch_cake: fix unintended tin override with
 cake_mq
To: =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
 =?UTF-8?Q?Jonas_K=C3=B6ppeler?= <j.koeppeler@tu-berlin.de>,
 Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Willem de Bruijn <willemb@google.com>
Cc: cake@lists.bufferbloat.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261119-cake_mq_fix_incorrect_tin_override-v1-1-3238122d09ca@tu-berlin.de>
 <CAPB2EApXULDiMGXMS6qg17NJRyEruybWMfu_d35tjBPdk4ftSQ@mail.gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CAPB2EApXULDiMGXMS6qg17NJRyEruybWMfu_d35tjBPdk4ftSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/19/26 10:49, Toke Høiland-Jørgensen wrote:
> Jonas Köppeler <j.koeppeler@tu-berlin.de> writes:
> 
>> CAKE allows overriding the tin selection through skb->priority: if the
>> major number of skb->priority matches the qdisc handle, the minor number
>> selects the tin. With cake_mq, the per-queue CAKE instances are created
>> through qdisc_create_dflt() and never get a handle assigned, so
>> sch->handle is 0 for all of them.
>>
>> For forwarded IPv4 traffic, ip_forward() sets skb->priority from the TOS
>> byte via rt_tos2priority() when net.ipv4.ip_forward_update_priority is
>> enabled, which is the default. rt_tos2priority() returns 0, 2, 4 or 6,
>> all with a major number of 0, which matches the handle of the cake_mq
>> children. The minor number is then taken as a tin override and the DSCP
>> mapping is skipped.
>>
>> With diffserv4 and diffserv8 this puts packets into the wrong tins. For
>> example, AF13 (TOS byte 0x38) under diffserv4:
>>
>>    ip_forward():
>>      skb->priority = ip_tos2prio[(0x38 & 0x1E) >> 1]
>>                    = ip_tos2prio[12] = TC_PRIO_INTERACTIVE_BULK = 4
>>    cake_select_tin():
>>      TC_H_MAJ(4) == 0 == sch->handle
>>      tin = bulk_order[4 - 1] = 3                     -> Voice
>>
>> whereas the DSCP table gives diffserv4[0x38 >> 2] = diffserv4[14] = 0,
>> i.e. Best Effort. Likewise, AF21, AF31 and AF41 are demoted from Video
>> to Best Effort. diffserv3 happens to be unaffected, because the only
>> reachable override (priority 2) agrees with its DSCP table.
>>
>> Fix this by matching skb->priority against the major number of the
>> parent cake_mq qdisc when the instance is part of cake_mq.
>>
>> Fixes: ebc65a873eff ("net/sched: sch_cake: Add cake_mq qdisc for using cake on mq devices")
>> Signed-off-by: Jonas Köppeler <j.koeppeler@tu-berlin.de>
> 
> Acked-by: Toke Høiland-Jørgensen <toke@redhat.com>

FYI, since this was broken since the beginning and does not look
ultra-critical, I'm moving the patch to net-next.

/P
