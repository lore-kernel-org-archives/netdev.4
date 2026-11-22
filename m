Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795343023;
	b=QfUl+vE6UJ/Jk6W5ZLIJCkhXSrECxACskDKCftIT4pBrg6GSKFHoNyNnHpdOxviLiAna
	 16XLJ35pDoiIX++CTEXh4daBjO4Nxp1LBTh84lyVfeUlwOw7x66Cu1DZvKzNtbcwwgJs8
	 fZW51Fyffak9UKAsYo3wvRbcofnmfMKjR7wPCqXK/mxJsOdvmktyjZOIbB5/jmynrc2M7
	 VQ/B6ldNiwaP1n3tPQaGHf2dF7RIhpeC/xYTuo9gy98SuaprVLk21mY/AxbWVnlm82XL/
	 mHpSUA+uPfdJym086ZCFB5+s0JMABHKgIEarxfFS9bflrg8vOxRX73/hp1O71NZmbpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795343023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Z5ElRnK1KcmWQzg796qjdcPFsrWyUv4vErbWyV6jKEg=;
	b=y0hTsHoUff1hr/vJ2qvRrM9GlKUvb045HJ+2BUZhaZn4nyXHzLG1Bc5IQZCX9Z4S/rIm
	 XmrzaifZvYnFHhYjExSzkUx1ZV74jB15yTwOmjVnaZcmcpVf8fKVcnwoX2ex5Nffg24P0
	 Y4S10zPVhI3jaeZn5XkF4G26rFqdWYQEBzLRpj3HnvyAGlzwu/Jfi8rx12iM5QFUKCVUB
	 FU0l6NNJ6zxvWMKSk2br7mx+wlwJje1B6Iupe2F+Q4H85rFDhwozuAwMBqpmnEe0evFWh
	 FGchpXxXAMRRJM/XvWwIMXXla+PZ7XOlj7TjtbIPrdUURA26oluoCBkG2OqsClSPU+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=YnhbfU8q;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1112C606A330
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 10:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1112C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=YnhbfU8q
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-491971ac844so2096639f8f.2
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 02:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795343021; x=1795947821; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z5ElRnK1KcmWQzg796qjdcPFsrWyUv4vErbWyV6jKEg=;
        b=YnhbfU8qYUZS02WO6s4axbDVc9h5DJFfk9I29JCcMD+styoAIUcakV4qcy+Z8bdNdg
         Cd0WZIClm9yvpavsH0GTft0p7+xkTq18m3kLioc9gaqX+3RhvEkZ9XHI1M42q7TcxGMJ
         ncAHuEQQQVAzdH+EG2Mm6oTLQJWqzzpnsQ0M04e8H9OnCZJX0bbKnHi7L3PzEAPuQ2vx
         BQxa7dTyf91S1zFPTzyLrGIERlKTpYLDNNDGht9imCbXSXvQlos0uD0uhbJiW1rEPG1/
         6kKbEG7As9IiyUtzO49ePN6W9jrjHmz4ZKvGhC7i+Ge7oc+Xm8oSEiLdpnZa4hWohYr+
         tC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795343021; x=1795947821;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5ElRnK1KcmWQzg796qjdcPFsrWyUv4vErbWyV6jKEg=;
        b=1LcG7Aon1mjoMEc0UDjcWcRiqJc1ax2dxRweeVD9GFAJfhVZY6HcpFAHhS3omeNXAT
         3oRAJkYFQplVnYsHLZQq1PZk5yKc12W2SUW5lZb5GC0TULMO+iGgfbxelJZwq+jHZh4a
         SKr8tmDT1n1MCUQ9CNWBj8Jv+Vd/iSHpxwh4Vexv0le6WVerYSqlaElB6RsFoM9b0V1Q
         sxAckgMkFNhSC8A9l6xhbTl0vRDhjguAoXTroHr2EDlLM5ZNjmLZogEck9ZTq/M0xY4d
         SySYHKQjXqQukogz3WgJVCkGu0Wmw2iBrJhX2YB1+3o7XKGifuwIhg/pvkbxj/XRIF1r
         mj/A==
X-Forwarded-Encrypted: i=1; AL+hErFMrdrc/nr0yjMPvuVG6llA+nJqfkqcXOrLw+XGFBSU9BtNeCHRNQyVqmGxQLWbLFHVyv80uHE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+B/++P18BD0QDlngPbfXbyOp/+NOnJBzzpXP0Oqpa6nINLfSwu
	e6YwhxnzRg6dgM0nPcffi0iu7GLQXfoEexadwEw7LeUKU1qSVkVgl7suakUnxgwnE38=
X-Gm-Gg: AZFdTZckNnIc0WTYbp18DSl4ngbckdmjwVbSbjyMXFu2wZnJeePIlIe6I+AB9J/sMNh
	uAhKUDi97xG551qIPZyknIOsWCv1cspQW0ne49IEYCz6tGfvh5A2TZyK8EeIiI9NZFIcUwaxL+6
	W4/RWV8+4X4DwcbT3mP2H1NB3YcgYKBwMbvJUhGr5wCqTxV4yCAO/9CEtTQiO0b336moh3BNcd6
	DgZCA6EaRCifDb8V6GQgcBl9b4W7bP3x2dABQ+TiF1QJpQGysyqlt7ljDvZYGjOtGIfBo1ZUDky
	KKqX57hzsPntMFsnrztZeXYGXclpJmjWprKzoXT4i0pSrySgn8gXdWiApx4CwfpG3KrrY+RqoPx
	FpvdhQ7L1ZyFWgKEnPJpbjFDhu+4PwoCe4CDidDsJgyGjbrW7KeVjXsbxGvtQ2+730oEyWMT17O
	rfuIR2v2NxIlqiEPT1YuG4oEzrHo/a/KBbNCmF/ap19O9ZDm2aLwgDijrnKbC7A4Gn36d3xSVGr
	IZ6D0VcuWBftRW62JgAlNhbhlcVlOmq4R60FvH6DMLa264dQpvSj5NU9GTjEqcYfLVjdZ7U5xac
	dVQa/iANSZOaIq33wy7QIfGpDMC/O53bCkU7f6KySp5GwVuBPsV4vX1Vo4Y=
X-Received: by 2002:a05:600c:37c9:b0:4a4:4d57:8487 with SMTP id 5b1f17b1804b1-4bb887fe7f7mr158409615e9.5.1795343021420;
        Sun, 22 Nov 2026 02:23:41 -0800 (PST)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm163162455e9.2.2026.11.22.02.23.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 02:23:40 -0800 (PST)
Message-ID: <60766188-3c81-4d05-b684-811136c26f91@blackwall.org>
Date: Sun, 22 Nov 2026 12:23:39 +0200
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
Subject: Re: [PATCH net 2/2] selftests: bridge_mdb: Test failed source list
 replace
Content-Language: en-US, bg
To: Ido Schimmel <idosch@nvidia.com>, netdev@vger.kernel.org
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 edumazet@kernel.org, willemb@google.com, horms@kernel.org,
 dsahern@kernel.org, shuah@kernel.org, bridge@lists.linux.dev,
 linux-kselftest@vger.kernel.org, kyuwoncho18@gmail.com
References: <20261122072504.2623702-1-idosch@nvidia.com>
 <20261122072504.2623702-2-idosch@nvidia.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20261122072504.2623702-2-idosch@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/11/2026 09:25, Ido Schimmel wrote:
> Add a test case for the issues that were fixed in "bridge: mcast: Fix
> source list rollback on failure". Check that a failed replace of a
> (*, G) entry does not change its source list, with one of the existing
> sources specified twice and a new source.
> 
> Output without the fix:
> 
>   # ./bridge_mdb.sh
>   [...]
>   TEST: IPv4 (*, G) port group entries configuration tests            [FAIL]
>           (S, G) entry for source 192.0.2.1 deleted after failed replace
>   TEST: IPv6 (*, G) port group entries configuration tests            [FAIL]
>           (S, G) entry for source 2001:db8:1::1 deleted after failed replace
>   [...]
> 
> Output with the fix:
> 
>   # ./bridge_mdb.sh
>   [...]
>   TEST: IPv4 (*, G) port group entries configuration tests            [ OK ]
>   TEST: IPv6 (*, G) port group entries configuration tests            [ OK ]
>   [...]
> 
> Signed-off-by: Ido Schimmel <idosch@nvidia.com>
> ---
>   .../selftests/net/forwarding/bridge_mdb.sh    | 23 +++++++++++++++++--
>   1 file changed, 21 insertions(+), 2 deletions(-)
> 

Acked-by: Nikolay Aleksandrov <razor@blackwall.org>

