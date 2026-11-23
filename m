Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437789;
	b=tUMcOH8VA4TZoHSgWUmNkATl9irojypmJSquxJ3bvmi2DndcrNbJdbzfRcaXGa7vhBsT
	 xRSfjXGKLNn1AvidLoaGri3gS/WGFkaP9uTp7/GMXfwH9jt6AQ4GTMJp+srgzvgqjaEsQ
	 eNUUuN1L0ZADeW9UpN8BGevS2WbNG9ziDyM1Pz8BbcoIC8FXd7M5+1iJjLykwGh285dHN
	 xC7BCXT65sd3sa4UQmIFLC71E8uIVHKg/QnDGd3ZabocI73B9AvwzFhGFM0V1Oyl+HVkq
	 2oliot7plqDcI4Hwi2bdYItSS+afBcf9frGw36PGIAccvLJ+SKpJA+I2g0aqbVUDjag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=4xkXXEJqgLnZoxd90O2Whf+Ji223F+h94sIuB6UxenM=;
	b=INB/J9V3meR0vrcHmYRK0sAQGzHp9OKAbYlSVPCGMkG4Bmdwcr7IbRwjVJK9gh6wQfOu
	 DMzNtDjJb1wooaCb7eYZoN1k/jxX3VfRxyjlD80zszqx/Am/F116YlSeGGmJt7j8byEGa
	 MMvorrH7gSs2W59ce0LoNTUN8nHlC+VnekYuXhoVBofxRLhkHooJDTBV5pxL1uldLtkFy
	 Sjr8PsOVXzgy8lk/p6b3AuorJ25jn6bUtOpAKzFpDmy11Mv2kTBzTBKKmiu/K8v4Oqm4e
	 neEYrB6vQM9Vm0Ymx+bLMsOQPvReACEqu3fCDggyaiCZ6h2s8w/r2znakQSedmUMR5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=oAkrxzwW;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFFF606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EFFF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=oAkrxzwW
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so20382575e9.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 04:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795437787; x=1796042587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4xkXXEJqgLnZoxd90O2Whf+Ji223F+h94sIuB6UxenM=;
        b=oAkrxzwW2AC2GeZjCTeqiCWp/cBSSAdEnow0hL04h44Tcn9a8XsDQa2SoKxkvHqiIM
         Tb1LbgZ7g+30rJjB7YHtH0D3e2+vDDxMhIHfZrKW7jcMU7Ml+N/wterxIl1liu8Tues3
         Of84sU862kuAwb8uEo+wGuicYDIGNSJDA+mzQKZVL96sLdnyecIpTWPX0/yK79iCCbnL
         JzvMiAYm6Oaq0p7AlMcXBGTcn1Y7hkJOEsHQuOldkj5++aFxjP+b0aDrzl6pg9Dm+8iz
         Am4d8H/+H1Yg8bAzVlxz0Ii2aNsPvsuFpP8b1NyhP0+wOUvcxllWfdjap/9MTiKGIds9
         q7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437787; x=1796042587;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4xkXXEJqgLnZoxd90O2Whf+Ji223F+h94sIuB6UxenM=;
        b=XDNNz01I/iVJkclqRWSSJt6eO0G5XwW6XOY5JV1+inHzzhvDBC6twWJ7diol1QQwLF
         Ge34VRZ1JWkn+Bs56hm7oDU86IjUGSq/CMeihJyPQXCjl565EstSBKwAYzBbRb5x8pe+
         RIoQJ+KwrwACZ1NxGh5Md3XXoNIPpv7pU0IxSkbr54WM+SAFkq27MlA2SRRXstMHMu+k
         L7U30VEq/DE3JiBtEngBhCcrnz2Hda6F6tSmS71IPQpHBXczt3eYLhOrugHIV9M26g2X
         rTWiM5cOxVT6fZ6Ucfp9qFxo+eVk/ushxNixKyqTmevQccvKU08hdH8VOAQQ0PwWKdyT
         M+7A==
X-Gm-Message-State: APuU4Z+GZSqLrUp2pp4QyQSxUoX7EyT4+R80ZZ+V7qBx60PHjgT7w4qj
	dMuvOlRj5AmXxGt/+lvfmyIq7LJvInT1WyqrSdoAkQOFCRltIuoqkHTPzLWfdyWRAWE=
X-Gm-Gg: AZFdTZdP1ykLFfIr/Rm0Yfo15tyjU00VMm39vGyNRBQhyVotuOadbBJRAsEjSy/Nliu
	jbM7L5jVsjjlXB9Yko7/CSdPDdmf0WzryRqwvKQraoiVC/J/2zH9BK7SvF8Ks6QVhciJW51vzTp
	r+IWtkBtn6EnMPVQtUfE5mzIKi8iIXPVZeeMYM5SGAHalj42VEtiWqpZ+5/OqqXwAYUDGb1q4NS
	61yzm5PTbcYaYa8JPr31qTMeuJlB6qAn+kPohYF+Sn9iyHyEsQrs53bpbFIonyLOUKSk7DnizXA
	1AhMg8gab/rWVtFoLUevFDfdV3r1X9ALK75skwe9zHOhgVWnPKwrz/J3EaZUrrxrBfzdkwB51pl
	hxYrM/YcQQ+Xwxz0AbsW+kKCfgiBGBohy2/IKvvmRjwfZPB6yG5WyA4BIHGwYXKn4KEMmqbJrsD
	WyDlVjeRxB8Gnv7mbv95kUF7iODb/wRwgWvaE7gqljhyjyHZZFB8VoKRzsCdJXmz/tgcEbd3Ux5
	x/0FwGv02EdjEWmQHc72+gvi1EM5QHP4/UM2iHerBw+gyD6Rbsav3f16jrxEFr1bjK0Q4SbCn3O
	uYvdxiArbcaBz4egUtNoJLc5crxFI+lAsHia0AXIgGpQN0qU7ZtBOmDn/H7Ug8FDR6AkpvGtQ3w
	RPB0d
X-Received: by 2002:a05:600c:3547:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4bb8880b88fmr227420305e9.10.1795437787370;
        Mon, 23 Nov 2026 04:43:07 -0800 (PST)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906c089dsm170500135e9.1.2026.11.23.04.43.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 04:43:06 -0800 (PST)
Message-ID: <9a533d71-7c7f-4946-9f5b-444db8737547@blackwall.org>
Date: Mon, 23 Nov 2026 14:43:06 +0200
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
Subject: Re: [PATCH net v3 2/2] bonding: don't let an 802.3ad slave change its
 type
Content-Language: en-US, bg
To: Kyuwon Cho <kyuwoncho18@gmail.com>, Hangbin Liu <hangbin.liu@linux.dev>
Cc: netdev@vger.kernel.org, Jay Vosburgh <jv@jvosburgh.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel@vger.kernel.org
References: <179535729502.2645501.5219010464870440@gmail.com>
 <179535729502.2645501.271186140389290426@gmail.com>
 <20261123032537.GE10218@Liu-laptop>
 <179540710966.3093990.1416762538136490909@gmail.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <179540710966.3093990.1416762538136490909@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/11/2026 06:29, Kyuwon Cho wrote:
> On Mon, Nov 23, 2026 at 11:25:37AM +0800, Hangbin Liu wrote:
>> Hmm, I personally prefer the approach used by vlan and team, which disallows
>> changing the slave type after enslavement. If you think we should only disable
>> the 802.3ad-specific part, this change should be merged with patch 1, as they
>> address the same issue.
> 
> For net I would keep it to 802.3ad, where the type change leads to the
> out-of-bounds read, and merge it into patch 1 as you suggest. Refusing
> the type change in every mode would also make the enslave of the nlmon
> device in bond-eth-type-change.sh fail. The test would still pass, as
> it does not check that enslave, but it would no longer change the type
> it is there to test, so that change seems better made in net-next.
> 
> Nikolay, would you rather have the general check?
> 
> I will send v4 with the two patches merged once this is settled.
> 
> Thanks,
> Kyuwon Cho

Since this requires purposefully breaking the bond with CAP_NET_ADMIN,
I'd go for net-next. About the general check - unfortunately I don't
think we can do it at all due to one, rather weird, use case that comes
to mind - nested bonds. There are setups which use bonds of bonds and that
will put ordering on the setup, potentially could break scripts.

Cheers,
  Nik


