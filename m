Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820255;
	b=AagNovgqrClBCqypQozlrvJ+TYequI/Ejx5o/2YUhYExffS8iYkMirHahOOu/BGE/lP5
	 P2FouKrQnfEbmJCiK3EOQ45/vIzUblrVoch/5KmRJlusK55jPVvWDDlHYusV1xiHT5jAG
	 rP68lWwjsN1r3lzq1gGg2Y/Gi78+mKwdYGa6NBzbdE4NzfNe0adde0Cwdt74BTqamxYkT
	 BluKGH0XYhf0QRO0QXewrNzY8Dqw1fFlDppd5PhPSIyaMWwg+8ubTiu5YS/3yty3Fnw41
	 EuT0DlLy4PxohC1FP+WSBU96JbvLF7CL4pBaoHyX61AHvYMjXoVStrI+P+a3SW/RCKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:To:Cc:
	 References:From:Content-Language:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=EYHRcsmBJwe47YIJUUfJX7irTk7m8zh1QYnvBpscrg0=;
	b=g+rWwU3j4KPIzVoPz33Qcz8iIDvIR7AR8bKwOBBFvqcD6veNjg0LlWOfOcOMsDZ4ugkp
	 edhaIB62NDUplase313HnZ3hnNR2FpwNxBNC2qqQuobKoWgc+ZsULZP4RkHi+tvlpOhVX
	 VzxWBv5D79/eVx0j1a5M0j/6rWhoBDFA9lb6nZhFMkx/EFXudX4gyjxwVUsA+c26mVXr4
	 48QvW6j9haNbBsyjqi/ibEF4jhyRJ7rmJi21huAk5fMR830nEuOtTmzoeZOWjLjlVv8kW
	 eIVfPxc2WDNw7z4t3S90lA6hCWfFsiWFbFG4mozDBTP3O5MVPOCW5nXrn/jeQKh5j2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=6wind.com;
	spf=pass smtp.mailfrom=6wind.com;
	dkim=pass header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b=IW+FEgsw;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C434B606A31C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 09:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C434B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b=IW+FEgsw
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a56e05568aso7517585e9.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 01:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1794820253; x=1795425053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EYHRcsmBJwe47YIJUUfJX7irTk7m8zh1QYnvBpscrg0=;
        b=IW+FEgswuLFoYQR4mBE1pm0BDCmnsS4YTSuUF1KEj2sXguZy0BqXQuOB4GXcOk+b0t
         sAVqhZIToOON1GeZu8PZvG1eAM7kbiy82D4QiuXAj/buhVYIf/0Nd4EdJTCSl/qr8ep2
         +o3OWVvJY8fSlZPzAqa6LYbkIz+WRqzf7ssOJBSy//1xtLDcrBgQHmLL8P/v33noYN+a
         gKq/kYQIn1rfHIrPaVfvfzlXtvXVYEfgwtsVu58qinv3sYQpBId9uVzpWI9j1J2VpzTd
         HSxhD4EQecf9V70oijka5UFv1ADXOn5ouZO7H8XyApJICH1Oo92NOPmzhLK3A9SmZU1d
         mE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794820253; x=1795425053;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EYHRcsmBJwe47YIJUUfJX7irTk7m8zh1QYnvBpscrg0=;
        b=cys1g0CM/GC5geNmzk6dLumKpDtwbdpt2pnJ1u5HC5JcCs+jI2R6uNKutwJR+v3kXL
         1p4axxMXHNunjLm5yQTNxOnex8m7+f8DF3NSxEWpxfM6mfwydAe33LFWqWnIMwKEcysS
         tRvnnGDFXlZKBxz5Flje8VjZNqvUwc1XBVTzgX2b7Y/Z9ugvYPKT4I3kQgMB0JUkgdr5
         2oWiGLX6oSLHiPpiXtmsJyV0EFaYtZzkem3h5LQu7HphaMeVcJnpdo/89iN8LXo7vFjm
         YoAltjIXG0hOwn+bXIpXDoMWg9LhL/iEaC00rzqqgS8hLuDElkq2NeW2d/qqFVBacwpP
         eUmQ==
X-Forwarded-Encrypted: i=1; AL+hErFfS3gw7sPuGyRtOvVcg7IBZaGxP9wvhCaISZU/jN0cujyOYGTorT/BgOPXC9TR8ERQb6BG3l4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6X2KMsZc9pHlNqtzjnXWOVOv6oEr+FgeNQrsTzLIP5vSxeXoT
	jhcxMQRqgEiuBhBA1Z1VzahV7ZDuuFe7jagBByftevbnRn93QjjEby8x+1mlNlkSGoE=
X-Gm-Gg: AYBFou1qzW86dD4JHgdPvmAlF2EEJVrZwcEXvYYSteIknNVzOQxgTs5X7Grbkbfbt2l
	+TyFN43MOZwQRXYkQ4TyeumttkV08HFN/J+BNKp2u2Wn5YnphU5Wx46Ll7pgbrDkHRO2tuaV999
	Hfig0u7Vveavc3gQuiL5oG3ZuMhbHOwt1yoe0cqG0BewVC8w0FHdG9/hNKSD+DDJXrH+fNYJvco
	oAKi1hLpKncqL3GcZkpEVYauD0tqPrp168THA9buXWg5nc7OOQx6nbuAN8gAFu64wRwrtUELqHD
	8RURZwvUx0pym6mch0cZ4McPb0594a7PLd3Jq0dFlBDP4J1V4LEscIFCOdkYLkHbHwQREr13MO5
	feVE5nm9Le2HIQw28wVZw4Mg26TXnWI5NBOhAKOl4vTr7hDGJx6HDLkq+JagB7u7z8DUCywN51d
	psIEN46Td86mY1pt6QyBxz45PMXUHSdRUCBpeu4ySsa77WNlilCe+uL0xlMDfQ41XWmKZ4+icmm
	hRYUqMeqnZ/Ius74ZeZlBLq06GHxkLBba7lrTG1OduqZKR3pz6CznDmzSI+5lwd8wfRrcTrl4bD
	+02qkN07e6A4zmTyetfls32M2Dqwo0VDIx20a73o3q80q8u1hKQ5Nf3L9GLwNieTDgvB19YTMQf
	GboJ+HZvR7L9UOOahfCS5dyead7U=
X-Received: by 2002:a05:600c:16d5:b0:4bb:732a:2837 with SMTP id 5b1f17b1804b1-4bb732a2af5mr22432785e9.1.1794820253191;
        Mon, 16 Nov 2026 01:10:53 -0800 (PST)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e252f7fsm379968905e9.2.2026.11.16.01.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 01:10:52 -0800 (PST)
Message-ID: <2228f17f-3d02-40a3-bcb5-8ba37fe5d063@6wind.com>
Date: Mon, 16 Nov 2026 10:10:52 +0100
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
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH iproute2] ip-xfrm: add support for XFRM_POLICY_CPU_ACQUIRE
To: Stephen Hemminger <stephen@networkplumber.org>,
 David Ahern <dsahern@gmail.com>, David Ahern <dsahern@kernel.org>
Cc: Sabrina Dubroca <sd@queasysnail.net>,
 Steffen Klassert <steffen.klassert@secunet.com>, netdev@vger.kernel.org
References: <20261030101359.1907972-1-nicolas.dichtel@6wind.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20261030101359.1907972-1-nicolas.dichtel@6wind.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 30/10/2026 à 11:13, Nicolas Dichtel a écrit :
> This flag is used to enable RFC 9611. The corresponding option for states
> is 'pcpu-num', see commit b544c7c5c7cb ("ip-xfrm: add pcpu-num support").
> 
> Link: https://www.rfc-editor.org/info/rfc9611
> Signed-off-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>

This commit is archived on patchwork, but its status is still set to 'new'.
Should I repost it?

https://patchwork.kernel.org/project/netdevbpf/patch/20261030101359.1907972-1-nicolas.dichtel@6wind.com/

Regards,
Nicolas
