Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442985;
	b=IT3cB90nxVvBkMn9oaTGKQmgY9c7foLM26Gc6k2EmcoY6INNnaFPN/HtoM93ZObzh8m0
	 B1Ncslskp2H9noMq8tR6Q+moGHP/mgPS8oDo55n5H8LPs4Pq12Suz87fA8LPb/e9W7cAw
	 caiB/OwICjlRjytwBALmujdT8rq8NnU+jILhd1XQVzh1dwKlzmEKjyMLMLXKZsEHy0JPg
	 8ylZArmCGsLk53YO5qul6r261CEp+W2QWQiywNaswm/HfoeNtqVpG6/uoXOmP7KwNGpfe
	 2eOW74Cs8mgDc3/Ym185dVIRq07B7xsx3SBiT47QlFy5A8lIR/S2f4SxLvygNPOswOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=0bvDk5tyLJ5TwCATr3/cvszAQOWSZaHFXbKMbS8WnfE=;
	b=1D4nRFfU1g3EKuFqvvseFFNhvIN34wtHVjq0pNg73OkTqLBdQ9QXRdEKJtn3BiiTrBdU
	 7aqhy5KUaW+VqJFcPjIHGEbmPef82TPo1gscZ+CCv+u3RmjuZL7DOG8KghQck96uIyTtM
	 raaTBG4wd0Cef3xIVTwreQtPS2WvYV37E8ZB51S0gNB1ez4z6X+FQJv0LFmpnZxSNsNpv
	 AaoDLgG/zV3xXqXJcDPBGiAGV1giA5d6dCBK1fLLrc8Hdg98uQ4Lap/YhZx+3ALJqFG7k
	 BJ+B04gisMOmhF/2jh7SZcGz51a1/qjuaL7N9KzlEWDOj4Tz/uKT5/X3FIJHqXtUWzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=T2k610q9;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FB2606A33B
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 14:09:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1FB2606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=T2k610q9
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b8a52db5f9so3954444a12.3
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 06:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795442983; x=1796047783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0bvDk5tyLJ5TwCATr3/cvszAQOWSZaHFXbKMbS8WnfE=;
        b=T2k610q9dq6ABxK10/kvUfovzJT448peNpB8dZUFJ7a9M95oiFWIkbejfgpR0jq3ps
         JmdtTO2qbdhrvAtfbsYXLVSDSj3iPLnoYA3AX20Nc6N5ilB23Ve496FNeGcV7q0NLeEH
         zwQuebg7Y6bLkIXAEUPHH+uSwfuw6ufCyUCvbhBU9NiUlyP57IAHmhxTFNak3+iNQoEP
         lOkgQOTDkr075zM9+0efVaR+ZKdXXN6K2z0jb78i2cdgl3LzuXCqes7vTBoEVLPtsHd8
         ZLjf3wMWaNh5pzx2RJwOE7G6lW3A4YPzGRKoRnnaO9HNICIVLd+xvK5jcsu4sWPpH5S5
         uetQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442983; x=1796047783;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0bvDk5tyLJ5TwCATr3/cvszAQOWSZaHFXbKMbS8WnfE=;
        b=NRERglPLWmWCKDQB8UmCBLLHCoNgee4bL1tmsBERYE+/OD+75/hxSoVfaGAZo9vugR
         Mt9we4DNk6WbUMc0yziEh9AdsCmz7b9DCqQk4rw/oNeqeclHgpjgHjCRojhBCH64Bmy4
         mzFP7kYmk8rtA0L2dA6Of0Ym60aNGWjYj2ANTwJDc6Bm0gDbTjeNhyZui5J23UoRacMS
         ldKcQESnV4BOc/TRSI2YaIVAtAUwxGMC9izyQ0B6s/MT1AwH69fvAJ4DxLoC5VF0Bvz/
         qnaqDS6IMQXfUQAX4SpUR4yTT7R09CnkkpZR9kHhm4VBS4w+a8giLVWVYpeGyDdZeQLg
         EheA==
X-Forwarded-Encrypted: i=1; AL+hErGrMEJpfoja5AoW9iPVWekj6GI1So3Xa6oEns8bu8KprDquqWeEEeNr16e6WS9v3M1a+z4vtxU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eZB3rqeKW8IlvAwxW24D9/OMqBZ7arrFAKuOsDOAg98H3PJBr
	XwPq970L0o79ghsDYPjOlNXABA1DdJ9ft1DY9dJTLgpINXHOr2KayJUXq/MGFxtXxVg=
X-Gm-Gg: AZFdTZfpMmuDM5fTMsnh/zfjePcXjY4nK/EM9Y16PVma8zTTak7VrnYuaBqo9ZsokE3
	ENmjD6ZU2LvTG63nG/HCW8TJkAPPHaW6zqExLu0c4SE+6twAGxyjlP077uKtg45kg4m75GXQhob
	sJApfLB0QqCLXEBzN8PLR1+lQYG4uvSfOce8utzEi1IdNmGcN36QkvfwbyfRNXkVh1a7yg+9SEb
	UZMvgxSs+9iGFx9a/JhfnVAzKm8fnpX/D1wqzBmyX2CmDJOY7kzE8SCxTjCMkGxXilDaF6MJYcI
	yRCH4U7c3VTalobAFsZpXWWRHgcYwXIvLN+S2onlYKL+rREMpAAULflSs4mY+iwp8PZ+wpmH/lz
	lS4W6xY+dhuj+DTlhUmAcUct6htGiq0UuSOIj6aWqInDkOtNw4O/YGYT0oHlNmYxTmRoZRTI2Et
	5bv1WBu+4Qx9WKktsRTj4NfCoR+8jbKZlHDDDMPSRugx6dfSfmP6MWSHAYGv18YeK7v92jk+WAN
	nl64e3ZUJpoHdBtJa+d0USlJOj72Xbct2M/nU/e4ivJHrr7YREZJ8ZbYTN35aFk8KBSYyfikXLu
	4Ow1Eo2gCuBJsq4MYeqrIz2ciXzrsoeXwBUqSipGXgg/0t0=
X-Received: by 2002:a05:6402:3223:b0:6b6:e74d:407e with SMTP id 4fb4d7f45d1cf-6ba37eb9c1emr9126325a12.36.1795442983003;
        Mon, 23 Nov 2026 06:09:43 -0800 (PST)
Received: from L9JK9NPFH9 ([2a09:bac6:37ad:1e5a::306:a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36d730d1sm5419955a12.0.2026.11.23.06.09.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 06:09:42 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Cc: hangbin.liu@linux.dev,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev
Subject: Re: [PATCH net-next v5 1/3] selftests: net: veth: derive invalid-tx test value from kernel max
Date: Mon, 23 Nov 2026 14:09:29 +0000
Message-ID: <20261123140928.13688-2-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261121182217.4609-2-emmaonana18@gmail.com>
References: <20261121182217.4609-1-emmaonana18@gmail.com> <20261121182217.4609-2-emmaonana18@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

Hi Omokefe,

On Sat, 21 Nov 2026 19:22:15 +0100 Omokefe Emmanuel Onanaroghene wrote:
> -ip netns exec $NS_DST ethtool -L veth$DST tx $((CPUS + 1)) 2>/dev/null
> +MAX_TX=`ip netns exec $NS_DST ethtool -l veth$DST |\
> +	grep TX: | head -n 1 | awk '{print $2}'`
> +ip netns exec $NS_DST ethtool -L veth$DST tx $((MAX_TX + 1)) 2>/dev/null
>  chk_channels "setting invalid channels nr" $DST $CUR_RX $CUR_TX

I ran veth.sh from net-next on an arm64 VM with 2 CPUs, under
"taskset -c 0". Without this patch, this check reports
"fail rx:1:1 tx:1:2". With it, the check passes.

Reviewed-by: Tianyi Gao <tianyi@cloudflare.com>
Tested-by: Tianyi Gao <tianyi@cloudflare.com>

Cheers,
Tianyi
