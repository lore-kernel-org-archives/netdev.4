Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795048899;
	b=IcG/cEhLaj2480yxySuzyf6DHedJnJJhWY3i/B+tDxCdBv7HLEEN+Z8MODbKVLXDXenG
	 vbHNbrZ98hXUvrQTWt4OPOBD4gR1OuO/1Ug1M6TmTShS793mlE5hDzUFVNLHIcmLZ9l1T
	 Vx78RrikUnqONq9qJbEwqrU2yRE5eYRX2MA9W7DNJe7OPgbtWUPaNDzu53Mdxb8Un9kbh
	 oMng+R9yUM96sccfqmXIROK+PNaeA20xhVJIY5BJpGUAK6AuTqhTfXQa+6Y1rcpHWxKZT
	 ufNOmJvqgDh0mFZ03kk19ACS5hCaXFYk7qyCMS4UPQ03k4HYqW3DedA7lZIB2x3z7sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795048899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=hvBatQBYMyCCrwFYx6ixL2SoWI3yMG92pdP59Av2nhY=;
	b=qkO0Dc9dBtR3hzThOHTs34AZ287Kh2YK469Oc7OaR7ohJmvmqgYdzynV5wraLTMJv2co
	 nHoiPBgquDaBU5YAlj7kOKZVCYfL8Bntq8EUD5qtio4vfixBccN/mmfYrWfY/UZIFUCyY
	 vv0XcrgMf5SPj7p5ziKsV9Ekbmb/NiZJxOavIYwed8ze1eZEKiKzwKdUk99Av234QKSgf
	 1JQa65YKcP4GUZGvkt53cwqWTPPbNtU/vP4Z1YCBp8yB2j1tAT4duyy7U6b5r90EWykyk
	 W3tRzL7xpYlGRsQUUrSsCY47dex+2zK3fgVltF/iXxylNPTo16REuZa42FYCZpJ9tpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GOb+xqyL;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FEE606A32C
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 00:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9FEE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GOb+xqyL
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c50686daf9cso40594566b.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 16:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795048897; x=1795653697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hvBatQBYMyCCrwFYx6ixL2SoWI3yMG92pdP59Av2nhY=;
        b=GOb+xqyLz68ulwX34svmLuibUnhYeJMs1CyRXVUiqptI/WC/pbUF7RIT3eSlVHgdVx
         bboW1nx1d1MzTPJLg8vDngDHQ+uH48Z46LoaHcNovFnEGEFip+CUPxlOzcZERklA2/OL
         nXE/VultkctCKfo21K2EbImQT6/aamY0EuvGAnk6Bjt9YVRE1Aq+v3FJyl+tgbUOB85o
         voyZUA9FKUClvOI9597Kux2e+uN/ghvWdtZTbb8pS7NulrYMpcAtY36GF3Y/ZbfSw3KL
         6rG4gSASL+/We76JNOwN4vn8qlzKOeE3Qu03obXV4OfaOeVrY99ts9oxYJfEJUzdO66a
         LsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795048897; x=1795653697;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hvBatQBYMyCCrwFYx6ixL2SoWI3yMG92pdP59Av2nhY=;
        b=177Vqwo3JQ7+PDWkVaJYBclnLPxQbQg/THsq3hUZge4WpeK1ExnNlbvlx6Ql5HcPhV
         Z4ueg2NUCjVUddBTiVGRTswSLp/Pn3tLJf1wKZiu/kA3ihSnY3b3qzsV9iPPJ49RntdY
         n15h3XrPW7yu1LaHPeqyKG4eVm5iuVKiyippMyYm3SjVt5INu+u2oia1PEliwJQ8gV4k
         CDtOTNgRldGS4l47zth0mlZK5hZdkacmosAnZZmqX+AdByOPa1X1eKApOvUgc8wlOTmj
         FEMMJ8MhdYcH0qrjP0S1aJlP9GGWdi2XlztaZpoICuxrELNKlo3KO/Z3htVcdgoweFxr
         9GMw==
X-Forwarded-Encrypted: i=1; AL+hErG6VWugvrLGADPIDKeWjj5K42cnHIs9iNjiBZJtkm06DSsJFPJZa7WWWSsi5ddszkJod2rBRDI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UVJQUVn0xDCdPxTgiXtDo5jZHr6MVSVvbrPpYixAf/gQ5TXQ8
	hGgDoc3bf5c2Gxy/jxImcwX+R1j9dKQH6sEQXf7vkVyDppPirNiJafoT
X-Gm-Gg: AYBFou07A4KQ4RLLC0PRiNJhrlXUXrHZbsIYvLn83RkJwrnjygOHyba8q1d31X2IYp2
	9eKjwFkY4JA1kReKWsixZVfXFqADitLxe7DNuxBYUm4dGRXwH74nRuvHolStmLsa8e7hntfJqy/
	5svf/GMl+Lioav/FnPrLHjoTEFnm813KGwln6NTpo0RgayWTTbkjIIRxlqeRcSnjOXXARq6eh63
	jheE8oH72Uwf8NubaUYB5JzqspHPZaxU2N0pp+gaBiwH2kWLfnJPZvPWUW/bZZ8EBmw50FaOOV4
	8BAoCjns3NM8/GLW23wMx2vV0FLnFJf3nv9rnVJ3w6nZj+DSyExyf+ZfJDT6MVpBfiavo3midR5
	y54yyXYLOMLaGXQdq1SLpJZctl/3s5VLv5EohZhHHF0ozPpEa4W4E0qAC1KgUpj3ajGli3oL3I5
	2ZdNfPLJ4csmeYuMcpnFy/tff9uaIYd2JOJ6uFm48KnOGp7Q/g88T5PPoGYOrL4ZIXROiHFHDsl
	tq7BanembmRrKJXVgGSjRAqTC4yRwMFSnoamo324kcfJ0pJzcXBTEneNMhoh/RM79KOxyS158rF
	AJJaGRZqlTppEScH1sB6fCTeI73cnEr1IwhuAYx2M+0hLRxdSHw=
X-Received: by 2002:a17:906:2a12:b0:c51:269e:5c7b with SMTP id a640c23a62f3a-c51269e6306mr85283766b.4.1795048896973;
        Wed, 18 Nov 2026 16:41:36 -0800 (PST)
Received: from Nuel20.localdomain ([105.118.74.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51234d2159sm52803766b.78.2026.11.18.16.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:41:36 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: kuba@kernel.org,
	tianyi@cloudflare.com,
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
	emmaonana18@gmail.com
Subject: Re: [PATCH net v2] selftests: net: veth: propagate channel-check failures to exit status
Date: Thu, 19 Nov 2026 01:40:56 +0100
Message-ID: <20261119004117.41043-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179486580141.3136.15559598598860423821@kernel.org>
References: <179486580141.3136.15559598598860423821@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

On Mon, 16 Nov 2026 21:50:01 +0000 netdev-bot+sashiko wrote:
> - [High] The fix is incomplete.

Legitimate, and already addressed: the three bad-setting checks
gained ret=1 in v3 [2/2] (also spotted by Tianyi during review),
restyled to if/else in v4 [2/2].

> - [Medium] Because chk_channels() now sets ret=1, the "setting
>   invalid channels nr" check at
>   tools/testing/selftests/net/veth.sh:467-468…

Good catch. Fixed by [3/3] in v4,
which attempts max_tx + 1 from the kernel-reported maximum
instead of nproc + 1.

pw-bot: cr
