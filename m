Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174973;
	b=IQWa+Ix5sbayJ35wOBfjy4+v7F9GZmJKpRAKtqOmh0cn5dgzGy7P0jJzK7AS+EvWODuI
	 jONbfyG2DBNpHcxaJKqRl2G0FlOmSNUxHHot5JbZcjUxUu/qbZeyW5bVprnz9T59BKt2q
	 Tbra6UBHsJ1wB9Z7wJvxUhmHtbpv5koObg9SfBcgBKc+5bSMtkd0rv5jdHkcAaOoGwZ4l
	 WxVgrl9vX/jtwzuKSZQp5t7TjdMIqxzYyL0s4exyx18/nu/hPxIvMwuDmBY3fqCYBnUij
	 jhvNvCa8N3w9X+kX8LK6SZb3Xe0ZfaohHgFXmgavEYqqqJn3W1abYoBFY4QoEdpMV6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=KmUpoxm4nBJnw9ISGVSuCY/zvYp9B1scb9wTk5sG9CQ=;
	b=P4EL0en7Co8n5wb6TFNEuAp/AT7fdzjphyWwr/iqFTNdbuml0vhAqMuJL9L3v65soE6M
	 w3Osjz2f/UzH/2vX3/9aovSsdxQdk9ybd/rd8IaHoupQkv6HEep+A0MzjglLK+X6dWI/7
	 uaZwlklxXn4u0JccBc+yaCrbG1BuSQ8n2CoiOVbdwgH0nHUnHJp8n/CJlopoYkrk82sFc
	 dsFPgocjEALJtbV7/kruD81i5i3AfgGs45d47jrXqbnGWDgD9Kb6nLH9QsrNGD++EY5dV
	 yzxLgzl4rvzkqu36xFRLraI7XiNWfzph49KiYo5yuFsfeSVFuW5RB8/bh54DFYnu5xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="nZ5wW/EC";
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1357606A325
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 11:42:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1357606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nZ5wW/EC
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2f0464dd6b6so2819235ad.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 03:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795174972; x=1795779772; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KmUpoxm4nBJnw9ISGVSuCY/zvYp9B1scb9wTk5sG9CQ=;
        b=nZ5wW/ECWaibl6yEk9kWoU2seTnTybbGwffyLsyRVxjw+ydPUoM71pqQ06R/8ITYw2
         uUMoLXrkmop7822Nf3s/h6kiyDB5A+kSX6o8TYa0nf31NNAnCuFhx5wJ7fCC28+Nc+0W
         HlR8gRC/EnydzotVT9DFJDKCB6npJDIbIR4FmTGJ2vUUrkKeQeyBiyTsw5qOrIpOkjL8
         2sHfKCPU6/F3+DS8O2foRr8Q94/Ph02IF+6J+HQLt0/MKY9qkuy70PPxnkHrY13yywcU
         2VEBSgDJVrlxbdzO8kkvKKsDRrvwg28YQTSiS0lUO/UAKDogMP32EgY4ku7dyVEIRuUG
         55Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174972; x=1795779772;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KmUpoxm4nBJnw9ISGVSuCY/zvYp9B1scb9wTk5sG9CQ=;
        b=FEgCFjMCr1fXAiY0CRPUkxpeGycMnPYJIPIi3Vb99uyexWLlkbefTYhfigz3be7x84
         lXP3fl8PKm9QmzzudNyOY8GIbOrWvjomI7WeDwP1vLTtPenmkF/ZCDrYsE8sdoo9AhCI
         NUQBcHEsl+Dn5x1hBWZS+Z3SDMDITM8l/8izNjzj3tM+WngHf/S17pz4RyfCHHBTTN2Q
         k8HeGRS6VvBLu5Uw8FganVZBLgzz6ROkcp093SjRvuJWBOuzLRyZ9Sgfry0W1DJBMURI
         ySnx33qYhoc0gyX0u4oI30SybR/TxQZcj1LimtOxXzSOceSmPmyCkTn+m6azZ0POEpim
         1s1Q==
X-Forwarded-Encrypted: i=1; AL+hErGo2IIF8yGaR5787HSxT75wWG/mS5Mmt51Fxtb33i0L8T7jDylnxQw7OcEe986C400TdrcvqAQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9V10O/n3qR9neTe7lcwJ5GeNj7CgAr1BQ/5Ud1uph/JPhKFRPl
	x9uHQYPI/Su7Gk0jeEZQC9SQW0+TInvtfTywB51uzcej6IeThlJjTI6hZm/664fUK/Y=
X-Gm-Gg: AZFdTZchZsBsMqsdPmOifppFG4QbpplOpifBcgVVbpRfWlbh1iiQKvYV09uZuAxbv8k
	jgmk5DuQ4Z87ilL2oV8bIU31BBIhiO7WMGU7G1INaYJ3gdAsVZA1nPBIbiHIGkT26f5amLiMLhU
	jk8e/L+OxBMn/08xkpv41HRds+UHMOlArGdkbck67SILaFicAvOu50XNpu+ixXbTInI/g/kgE08
	+VjMLTsAtjF0CYr2L8P87CbC8sEBbqm4uKI2xV/HI+ex9FPO4UC0Rhi+QV4+XzQ3guJlhQp5aez
	aoDTwOgNDzQxxTCpxlcxCY7W8Xm0XFNJfjqJYMz/b44kcYQIpPsYJFuc6bJq7dLds6HRZcC3mAv
	5ZDS6enFRXuPVvSy+8BF8f6/CgGZ96nlUMPWNA4k+HPnOtZfAtt6LZ0avnamFzwxTXUqkgdBU1f
	IlRFcTxrzbc4lyOomW/Fa/yc9sPodX5hTXTyPx79ySM/IOd8YujFGs7HOKn0kIdbUa2jQrZuUS3
	JtE96859MoL/Wri8yUodKc7GYU/hNEZHE8jZvFTYmUkAf9WhbnP5yPZDRdybjKptIIQM5dnx5WM
	DLQeAQHMzM2hpyNkzP0HzIFF+AiQ/lK361gIz0hO8ZmpM2iFKqkoZfbWpdiTR1KKO2qkOg8uQDG
	BQS2HojbRMeH6yxbWHhh72OY0aPHLTdir8CvL
X-Received: by 2002:a17:90b:3f0e:b0:3ab:1481:69e5 with SMTP id 98e67ed59e1d1-3b41c8ffb06mr2420129a91.11.1795174972276;
        Fri, 20 Nov 2026 03:42:52 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cea7c38sm1226012a12.2.2026.11.20.03.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:42:51 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: alexanderduyck@fb.com
Cc: kuba@kernel.org,
	netdev@vger.kernel.org,
	kernel-team@meta.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	daskald@meta.com,
	mohsin.bashr@gmail.com,
	bobbyeshleman@meta.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] eth: fbnic: validate the Rx completion buffer index
Date: Fri, 20 Nov 2026 20:42:45 +0900
Message-ID: <20261120114245.3072211-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009175358.1598001-1-yhlee@isslab.korea.ac.kr>
References: <20261009175358.1598001-1-yhlee@isslab.korea.ac.kr>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is superseded by v3:
  https://lore.kernel.org/all/cover.1791775409.git.yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
