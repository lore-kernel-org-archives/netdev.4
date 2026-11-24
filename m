Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795512665;
	b=Ns8AbKo3DMeqMz0WvCLFfjdpa0ht6pG4ja9eWK9AHSFGfibDV9dac6R0x0zVzPFxITbX
	 EjgeQ3rpS/LOksUYQNyV/7FXudGth2+hNvVYC3+cw/NyljQi3UvwlDyqdzWS9uh64Mwwh
	 +IPySg94UT2IC0AigL8yN63DDhED/GtSXIvkloljwqgdl5iw5WMI0eEhdcDFGFinT/FZ/
	 RSyaAH4TCPDE9fJm8nh9QKV9LjOB+Lnyp0xk6L9fv6UTLCx34eP2jd6qUBuMoqsl4QdrL
	 qgec4uqSepIiYBKRaKaj2XD2GASKxJ+g5Yhptc4YQczBOkHWpHdCDX2I6eAg5wYWm0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795512665;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=p8/AOUE2k2Bi5Zz6s9PwthDlESwQmQ8r07ZNdj5Rp/Y=;
	b=VsnTDj3+oEjXHYiXAtF6TIdYAL5ycMVXDMk1ZLjEy87hAn6v5f6RA5klqsnNOTfUf7bZ
	 +E1rsx+xM5+7gKoaFnaJdI1QfpGMOcDrrVN0R3VhdaqlCU6va4tj9sk5qk7KgyzCn0nAJ
	 kEUyjLHR37mAg8LKgSlefRcCfQEM1L3AYrKBuDUlB2FbolCQlidte8OFpprn6DDmSxkjA
	 c0SvGHoC8HTzaFF3tkKy+bnGXlFqel6wSBSO9BQenSbRnH70GigeF83bf+Xa/4bx6+Ws8
	 k3i382QPqwV0L9dE/3PLVaqlL7ZLn9JzY7eUisrBMLxSFZrmQfVKZJW/T8t5PYYXGzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J0LxC01S;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=g5nEKchU;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D06606A327
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:31:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41D06606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J0LxC01S;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=g5nEKchU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795512663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p8/AOUE2k2Bi5Zz6s9PwthDlESwQmQ8r07ZNdj5Rp/Y=;
	b=J0LxC01SqMv5Z/qpiASWxdDLMMPFI0FI0uRkZTFVkMxmYE7Dn40At+sfiSgaeK5mNffDk1
	5PQ9xanmTHGAMJJepyvtLfydenQ3xoMPFaY/SPL/bVRkeQS8Nj7Wlcxkqrby6llNHqih2Y
	eP5bNnfaUZHgooQn3j7BhBKC9BFYjmI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687-cqsUUC5sON6QLNToQaHCTQ-1; Tue, 24 Nov 2026 09:31:00 +0000
X-MC-Unique: cqsUUC5sON6QLNToQaHCTQ-1
X-Mimecast-MFC-AGG-ID: cqsUUC5sON6QLNToQaHCTQ_1795512659
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4ab855a8c21so3503178f8f.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 01:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795512659; x=1796117459; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p8/AOUE2k2Bi5Zz6s9PwthDlESwQmQ8r07ZNdj5Rp/Y=;
        b=g5nEKchUY/sgW+6GB07azuSey4SHZ/7OiYBQtrAtPPazqHviffbCL9I4dUVBMmShfZ
         ysnYJ2BJE9jkGLeDEJ4gVOfq0WbXbWIm+XKSzJvDy0Xzj0QZPdcTMRE7D3+08SakR0/p
         XVQmzgTRp1Sw+ZTpYjFKZDVo/xAwTbun179/ovaw6e/Ef9cMRJ9h6eRfjUQSox31vZ2U
         dj3RLGQg2eTVmWYw679NMiKbFinOs0l8FoFPW2QecDjLv2mOzl5ZY1rwid45YMMZrIkj
         uO+Ckms9Ne1VOhNGOom8ahI3K+lAVL4OlsGWyMryKHUU6VA5SlUkx/pA3pLDlRoNe63W
         OHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795512659; x=1796117459;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p8/AOUE2k2Bi5Zz6s9PwthDlESwQmQ8r07ZNdj5Rp/Y=;
        b=Dhu1K+aiWBdySRfP7HA+UlESFxIK8tv4xNUzttwTgeCNFFh74nY1tbfblZSDxIty7t
         P3GmGwCeiEvn/y8+BVzeO6VAXBlmx1kWCOqPI/3A2YAPfWbk5PwlGYdU7Zjr9Zwo+owr
         gfJmiQfqvBZ7loMHmctpH3n6OLgkK8xpYYkO6GRapXLexwkrhuxj/NXwDgQPFh7Hvxed
         dLMmWI+iwF4Y38esdolzfACiv4q3u/Qimibbo1HXrWjCzwLwdH0ubeBEKvwyK2Pi2cxM
         wD6VH6E5Y0+B1Lg4R9ZdDVLrDnu4+pjlHdRokOiwXZYfPvcKQ/ApPbz+i7FfZxTk0XQw
         M1RA==
X-Gm-Message-State: APuU4Z/UfaurthUcPdS9PWZAUKezXsIUydy2giRjF7wfN7cQSViwwPP/
	/j5aqp9+ExiyOq5H9eSdj+lGXAJxz9cKw3N3DGplpjuLKcS2vkBU6xEt7y8nktW5hw2fd3nrbhU
	UteSLJ50o20CcYSUBeC8fpcQKzJmySLhfVOpVw3z6nNEaDCCuOHgpvwCpIQ==
X-Gm-Gg: AZFdTZeriRk3MIYo4NIgmD/cs0nwOSW7GKRWc10+6asedoBoUsAd4/UcDRLhSzHvHwo
	OTELLe7f2Jzf82dhFYee9ok5vSX3+BrDbGSoeDbCgK7o+mJQbjDklUcbf35TISpx+PvdhTea4OS
	vRSXbtNMIZQq2UX8aAP3ZVgB9ubOwLJ3Eldlsdxau9yqjOSWG428E763usfmeuFBmJFegOhf1D1
	pBdg2dLA6d1aVbXqLkT+I5AdmiML2StfUAOnj/CY/hirD0poGiRNk9VM1WY5cQ7AKkIvz0iulDh
	1yyEAEwlkTT4rLlrtXD9iW5fSpijVYJvGdrzgAHm0rss2WUNMlHYjSHY97jEtQKoHftwumZig1e
	zdd4SbyuRhl3F+VXDgXKFKXVRhJYlwAZ+73rji9wwtgr8Gwspmpz6Z7Km23v5cQ8icfhQVpBFh3
	ERMGGwyZ2VCFK5kY+fnbQyF8wc1SdlbEvjXb+eeTrssW//
X-Received: by 2002:a05:6000:2c05:b0:4a9:df02:6040 with SMTP id ffacd0b85a97d-4abaac57bf5mr26381695f8f.3.1795512659250;
        Tue, 24 Nov 2026 01:30:59 -0800 (PST)
X-Received: by 2002:a05:6000:2c05:b0:4a9:df02:6040 with SMTP id ffacd0b85a97d-4abaac57bf5mr26381657f8f.3.1795512658831;
        Tue, 24 Nov 2026 01:30:58 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61e8sm28289277f8f.11.2026.11.24.01.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 01:30:58 -0800 (PST)
Message-ID: <95d49bf8-21b3-4ea4-961c-d5a229995829@redhat.com>
Date: Tue, 24 Nov 2026 10:30:57 +0100
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
Subject: Re: [PATCH net-next v2 0/5] net/mlx4: TX helpers and deferred
 doorbell fix
To: tariqt@nvidia.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, horms@kernel.org, linux-kernel@vger.kernel.org,
 daniel.machon@microchip.com, Jakub Kicinski <kuba@kernel.org>,
 Joe Damato <joe@dama.to>
References: <20261117155353.2250540-1-joe@dama.to>
 <179493106742.3291.11434436383058043225@kernel.org>
 <avyELebAXqr4y1Yi@devvm20253.cco0.facebook.com>
 <20261119143852.3bca9000@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261119143852.3bca9000@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 23:38, Jakub Kicinski wrote:
> On Tue, 17 Nov 2026 08:43:25 -0800 Joe Damato wrote:
>> The only fix in this series is the deferred doorbell flush (patch 5), but I
>> need the other code (patches 1-4) for SW USO support I plan to submit next
>> if this series is applied.
> 
> Not sure if this is what you meant but this may read as if you were
> sending a fix for net-next for convenience of sending more patches.
> To be clear - that's not a valid excuse. That said, here, we're talking
> about a 10 year old error path bug which nobody apparently have been
> bothered by. We don't have space in net for such things at this point
> of the cycle, anyway :S
> 
> Tariq, could you ack?

This is small and clean. @Tariq, any special reason to skip this?

I think we are better off with this merged; if nobody complain I'm
going to merge it soon.

Thanks,

Paolo

