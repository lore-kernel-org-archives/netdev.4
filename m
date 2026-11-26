Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686702;
	b=y9o5i5pqfqn09uD6b0vmfaUKxYFzBE+jI5wPzsKrYCFhBN7HfWO2w9uGBZx5NFUgnwY2
	 JxJf05DQgIKBoULg7LXjdO9qOc6raD+26xZlkAZxgWvVK6eLDLZYX4yjueuL2ak2KoOvW
	 5WaJvTzI1YttZ+DtKA6XOgAdlQJOfpsm4lMfGKVPyHoSf08Byu8zguzBid10nJH0VtLOL
	 SNyc2w8yz2Cdq8YEWgk7ifivYXfx+VT3Imn9tAehoG/fHzM8aFCx0HO2vz0o2SEFL/mkK
	 r/pTtJGw+Yr5wH1VshF4t3aY7Qqk49xejD2HkwmpMqgz8qj8ZSdDIbv9wjpBi8sV32Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686702;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=b2b0R37N0cNDG6LwdnW9AOEOCqhnsuMIntkJk3OiCVk=;
	b=LGlDr74aDpJZhf15+YmEW5i3/heTB+hZ0C04VsBbjpe6aYKUTlBc68MWTey8+fqrYlbj
	 otyd5HmHaOWQ1rAOnN4DZdXhipQsyHw9cNgbmMS7BTYzRilQv1pklmti5Ilh/OT56JzHy
	 rfS87xiAaLRH6pFVCLqPEKulolIhZDCjLHNmzdz57HCIRhcRBqPiWS5+qnQWg/DFaAaBJ
	 DlrMyuOPiauovsIXC4A/R/7WniaQ/hhN9TF7a1PFcpIaljGcPvs1DoWiNVpHHcQfJzeXY
	 iPwBeMHshWKUzW6vpNEq56uP3cSsU4qK2+IcO87d3iqrU/Iha71NKbHX6GT8qxUf7AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NglhJyuj;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=eSf5YhDs;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB60606A323
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 09:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DB60606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NglhJyuj;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=eSf5YhDs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795686700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b2b0R37N0cNDG6LwdnW9AOEOCqhnsuMIntkJk3OiCVk=;
	b=NglhJyujZidG1wh9KnE18o4xefEtv14FMcA8ak08V8XoQBmG1b/fEVGJVd93CrD2oKQcEL
	BfK9jY60wQ/5xihueEr7sr0WBEX6qLW+zwl6kFe7MB78aGE4j3q+XqVaOHzFE/VuEvQPPk
	1W1N1J9zC+JGOaMEj4ahFxjpNHuJLP4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-O45RJIZIO_Kw_b8svi1jrA-1; Thu, 26 Nov 2026 09:51:38 +0000
X-MC-Unique: O45RJIZIO_Kw_b8svi1jrA-1
X-Mimecast-MFC-AGG-ID: O45RJIZIO_Kw_b8svi1jrA_1795686697
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4ab855a8c21so5385465f8f.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 01:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795686697; x=1796291497; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b2b0R37N0cNDG6LwdnW9AOEOCqhnsuMIntkJk3OiCVk=;
        b=eSf5YhDs7s4d/I+PuOqPG7GnNpSXVv5YHZf2MTaDiGSvROudWXnjtlOkgjVsqw+WpP
         lTDSssv14eAoLBy0bl1Ci2jfbWBegKn7XEOaliLTA5vt1Z6j1pZiFCA0AAj3hDDltBos
         6C3+AdPdLxVsXx8Xv/cyIHWJ4ltIx7vVQKZE/K8Nue9lFYlJMLTfgqalzC2E/rzpZQPA
         O1mCoK87jRv6TIUQaOmHgKqRFIOu4HKDLbFnkUfgPdOLYDcP41qbWWBllhlVS+lVs3lb
         QH0d9NXFvc+ZBTENAKxP/WwA5UuA0jDFKl8yuoT0dYbrNJ8LouJ070V2AyeDNGcZVAq1
         XW/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686697; x=1796291497;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b2b0R37N0cNDG6LwdnW9AOEOCqhnsuMIntkJk3OiCVk=;
        b=woweKWOiA2aEA/AE/HF7E4L/68a/rE6QkznW0WDwNhFI7E0/OaeUYIETEsXnkhS/QF
         vp7Kk4eQiU38WQuePzezZB/L2lbOSRmf4Wj+kaCs5wFQ5MiA2xBtUliySVJ6JrnviWgQ
         iOCghPlc+cBKJET23dTyZyOHoFy1/C9+ITAlW8keil0JEg+72eaGGq3zi8/pDwTdssUb
         ll44pcNwyF3kkV4CP1TQnkGsXpVf8Lzh0umxpnDNaCuObW2UjiINRHw3jcT4CwnRW4dl
         Y31d6zJYsDBPxK/CTSKlpLZp816RdE5jXQ3IYTW9J//QvUUmxqxdOh7e8MMP/U8fcKnz
         jhMg==
X-Forwarded-Encrypted: i=1; AL+hErH4N/lIA9dvPwT3o+fvojLBxB2Y63fWyqMSaVZxkp7c6ft34u5uirgBrIqT9HkFru6wayf+DbM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pg3h7Z+f+8Gq3snzCVAuAxfRJUx07uBrJje4uGzyOZYmfLOU8
	nSGKbtdVrFYJme6RKQ1xs4LR72Txx29d1Zmf2uKZZVIMB6PWHQ5Fu0HULCrA8S7xq4on0vYjKSC
	OG8/tLDl9v0/+5ngzlN2kRzWtkeTBLg3Y+WarCqKSKQVdSnjSLI67CM7GqQ==
X-Gm-Gg: AZFdTZcB4Ue9nU2XElA2r91Hqcj4pS1o+NEGuDiPPZQXFRNGLnXDMggCG2ghCgUsX+V
	wuoIRig4wet/k4+ZznDKpaVesVcqYlQ/p+lmkeOPJdG/ywd72FXumImil369OmQOkqjWB4xlmLW
	s2LsLzxV5b0m93QPq/nAGVXY4d8J5wjLSv0n5dOPDOFhMHlRS4aWeUu/bKn5a3cMmARXU+i0ktK
	2vW9Sor1dU8Uja0YW9tB7ayyoKCZcPUPbo72idz925Qgw01Sop9miSUF50gTzkLwDqMmyt5puFi
	90PM901HZoW60OQSDQDcHYzKbs75YvANsKIQwN2WDEGXCboKJkB28mBdi4Ia3h2VMNAmqTGCMpn
	iKMTLR/H1fGdLaJtCrVbvGcRt9v6PMe9knPOGixembK6pUwGfYDP6YsocRT9+ETw9I0fl3n+uIf
	UY/A1BYguuKMH0sIsRaDDm4maluc5SwbkQlj9BOZtX4eyP
X-Received: by 2002:a05:6000:2c13:b0:4a6:9f2f:4153 with SMTP id ffacd0b85a97d-4abaac57ba9mr38614712f8f.1.1795686697236;
        Thu, 26 Nov 2026 01:51:37 -0800 (PST)
X-Received: by 2002:a05:6000:2c13:b0:4a6:9f2f:4153 with SMTP id ffacd0b85a97d-4abaac57ba9mr38614627f8f.1.1795686696684;
        Thu, 26 Nov 2026 01:51:36 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm39627871f8f.52.2026.11.26.01.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 01:51:36 -0800 (PST)
Message-ID: <e07adc3e-838a-4c46-a56c-eb47bb9e77f4@redhat.com>
Date: Thu, 26 Nov 2026 10:51:34 +0100
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
Subject: Re: [PATCH net v3 2/2] selftests: net: check TCP IP IDs across
 tunnels after GRO and GSO
To: Julius Bairaktaris <julius@bairaktaris.de>, netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 willemb@google.com, horms@kernel.org, andrew+netdev@lunn.ch,
 dsahern@kernel.org, idosch@nvidia.com, ncardwell@google.com,
 kuniyu@google.com, steffen.klassert@secunet.com,
 herbert@gondor.apana.org.au, richardbgobert@gmail.com,
 ecree.xilinx@gmail.com, andy.moreton@amd.com, alex.austin@amd.com,
 linux-net-drivers@amd.com, saeedm@nvidia.com, tariqt@nvidia.com,
 mbloch@nvidia.com, leon@kernel.org, linux-rdma@vger.kernel.org,
 alexei.starovoitov@gmail.com, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com,
 martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
 jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev,
 john.fastabend@gmail.com, sdf@fomichev.me, izaiahsun@gmail.com,
 corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 shuah@kernel.org, bpf@vger.kernel.org, ipsec@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1795284858.git.julius@bairaktaris.de>
 <2f75527eb49d7d4ffec32a61fd7dd080673dc57f.1795284858.git.julius@bairaktaris.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <2f75527eb49d7d4ffec32a61fd7dd080673dc57f.1795284858.git.julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/26 19:27, Julius Bairaktaris wrote:
> Send TCP segments with fixed or incrementing IPv4 IDs from a packet
> socket, let GRO on a veth merge them, forward the merged packets into
> IPIP, GRE and VXLAN tunnels over IPv4 and IPv6 and into ESP tunnel and
> transport mode SAs offloaded to netdevsim, with segmentation done in
> software, and check that the IDs of the IPv4 header in front of TCP come
> out as they went in and the IDs of a new outer IPv4 header are unique,
> or for ESP tunnel mode increment within each packet. Also forward a
> VXLAN stream with one header's IDs fixed after decapsulation into IPIP,
> and send the merged packets through a tunnel that the far end
> decapsulates without segmenting them before it forwards them.
> 
> A test where GRO merged nothing is skipped.
> 
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
This test is very unstable:

https://netdev.bots.linux.dev/flakes.html?tn-needle=tcp-fixed

/P

