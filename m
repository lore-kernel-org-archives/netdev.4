Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556595;
	b=UQR1pyxVMMSAPATjOlVGph7MGK4qDRiDmcG3Oxg7n3uh1D64vhymoKu47Jkz3kKtnDKH
	 1huM8ZOBtbDtUMUQ6JptqpYgl9bqEVdKcy8QCFR7gs7G0G+P9wKLpj6nqLdOOAPKy2kq7
	 2L30Ds82MJ+XStkWJTXfSdMEMeJPGCyqbHzCWqm6lJ+lLeQGM/GqEAz5pAWOo3Sa8nGWf
	 fFSUa3a/3ByMzJh7/MXfR00XujYKmtaPy0/vzwNscj+U5Ehxa6pI8yqoIwTTlNFh/vHN3
	 j9zTkMbQw0E1uPLJ8/bB1YzVWgB5oKmEN/Grd+iwU5gvX8DxM7RYfpfDhKSH7TS2oFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1dgevjOWuJAYh7LIS5HDx0mssJ5LCiALLAiYYaKE9M4=;
	b=PHOKiwiY+TmyF4N2u6tD3vdLLP1lU+FLDbiuqqAAKQufRirE04UV3bKQKmOk2FT+Wfkj
	 3+rWtX8bOsmsh0AoQBsDoMm1lKbMmIOBqEV2xKHL9gmQN03Go6YA80A0WGNd3+intHRai
	 5OplssBq1W93WxgFv3awKs1L5zZ+npgTDQ5NDDWUBO5syOK+vrDJecG4ds9t5kIk/PzPh
	 b7c4+16xyUOHxSgkHhLFAwdzhntmggohqDJrKCPJNgkiGs0rywcOVspaH8x5Df4CEuE13
	 0UiqYdnzjXAU+BYklslfm5bJXLbIl6vlS33NrZZYxTgManDsgEoP2w2Zn6M4BDgoE8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0LgHWBrb;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837C1606A323
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 837C1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0LgHWBrb
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb66245c51so3296215e9.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795556594; x=1796161394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1dgevjOWuJAYh7LIS5HDx0mssJ5LCiALLAiYYaKE9M4=;
        b=0LgHWBrbm09GnvzktQXlq+YoVhTra+a8APFk5vqOolCQeExJ2faUuCcI9hv+G/9vCv
         Y67rTSPHFaLPgYL80KJv2kRu48ClOL7d+Pguh3uoSPikRzMiRgMmwMYXC35wXS9K486r
         VxHTpTW5Q7cqFI6ZBAqWwec1Rt4r5FgfiLu6EI0euirfCHVplEa4awaH+j9cesVX6RRk
         UJJg18yWHb0hp9bSHAWODvxczxKVMBykGIdWtrgK1bvLKecrE4Yd01mpNRSp3MjWSY3p
         mDNbqM3QgFP2ND0EuUIcaDnK5m0rdjhwBYfdGOzk3ifogWrpN83n5RZZMDEDu6dRiRLy
         z3ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556594; x=1796161394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1dgevjOWuJAYh7LIS5HDx0mssJ5LCiALLAiYYaKE9M4=;
        b=aqNPdR1aoq0PZsoHYP1VovVKsEQnw579HF6mSj1t9gY6mE6Egy1hAyguuc7aI7nqnh
         LogzdsTRRuXvCtUt+8ikEGK867hgFtx4FjVpBmS4lZ/JU1G0C831xmaugmeERxHYJsUv
         iyGB/AFt0yOzFMr2T4G75bMo/kBSei+2v/BGlWUH0hPoEUKBhKgoKMAYwpfep8hpRmNb
         V9S8J1PxgBDqXPgWUXnKXDE1xvzlccgrlc4tIbjm5q3IMygHQjh0v+sTteti4MUfz9Ok
         OaKiTJTuwk6zAxDJYTXMh7AjDV9YaeRZF41HwDEwei7ZJ9FBTCOObI0FwHAoikDnL6+0
         nuvw==
X-Forwarded-Encrypted: i=1; AL+hErHu4fRFSlMaIAsIkjY0LwihQosILfV2lz1dSkciq/Oovw09u0Pc4ueHELJPctUaSVnqQGmCXOo=@vger.kernel.org
X-Gm-Message-State: APuU4Z++ZSDfLx2YPd54okgXcHzwTlf+AeVfCldFWuFxrf6uD8rCPQvS
	RKTQkqTaU+Qq3x5gWNnRxG4jA5hK6DJEF1zIXxc3x2S0GFxidab3LUmW
X-Gm-Gg: AZFdTZf6CvyPGn8mPbHPhIJgHpjDKcFJks4rO/Vh2rCNLeoQABExGDolvzXpSHTJPQ2
	sygvveZD3todEnq1MEIZXW/I0LpVy72PV/Aso/phtb2DaUfYqh8he0xkizwN9JeP7/ij1pmCRjr
	VgH82LOso3OqjzM/ah4iRPhQ5raISTB7FeqUo9hL0JJ5xQVcdpiIDh68DPhkJfL0zeKcFTsTaeE
	Re3dTLpWeLltoCMdjOg7TFMU8bT0hUxWg7PSBunpMUpE+XQi1hgs713uuZS7abjBiY/pomgXWuF
	luA3lYu19twjxeIXUbiTUrwHwcg46KKiQMsb4d4kYNycaCiE0+4Tyl+0iJSe/qp7tk8+e/RXg1i
	QLjeyX3A/+4+zTH5NXaJQbtM068mp0mCln6kDK61HX+tDJdptJxj1UFjPvG3dd86vXi92t8vO5H
	FVSaTV0v9p+CD+MAyeZljy/5/60/7J7yUi+CsgebLkPCeWKefV3VG7G7rrknggS3lyfKvRRJ7w7
	WziEHLrjMijx9rKtowKwdpmihHqAOo6SQWy+T6TqBtcVfeRVFoeAZz8dhrVtHcklY9yMORYGgS5
	a8Zd5ExoMWay2zp4NyhLKVuaSDupeCvJyydOv7ekghWkE6Ta94hX1Sgaxgv5nnJch9IW
X-Received: by 2002:a05:600c:8284:b0:4bb:6c01:de9c with SMTP id 5b1f17b1804b1-4bb887f55c1mr283837645e9.2.1795556593828;
        Tue, 24 Nov 2026 13:43:13 -0800 (PST)
Received: from Nuel20.localdomain ([105.118.4.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm244195265e9.0.2026.11.24.13.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:43:13 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: tianyi@cloudflare.com,
	hangbin.liu@linux.dev
Cc: kuba@kernel.org,
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
	tianyi.gao@linux.dev,
	emmaonana18@gmail.com
Subject: Re: [PATCH net-next v5 3/3] selftests: net: veth: propagate bad-settings check failures to exit status
Date: Tue, 24 Nov 2026 22:42:55 +0100
Message-ID: <20261124214255.12280-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123140946.13992-2-tianyi@cloudflare.com>
References: <20261123140946.13992-2-tianyi@cloudflare.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 23 Nov 2026 14:09:47 +0000 Tianyi Gao wrote:
> If you squash this patch with patch 2, feel free to keep my tag on
> the result.

Done in v7 https://lore.kernel.org/all/20261124214025.11603-1-emmaonana18@gmail.com/

Thanks for the review,
Omokefe
