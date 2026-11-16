Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794818497;
	b=tX1TLBY2Gzbi9w7aYFVwDdX/xj/aHsaupLTTKyFplFtOXKAyznevUdCLxEiTpHjCy9H0
	 2Wyc1f/p0lLeDI0cfyh82v3Y+rSjM0slw3hO4h3+YNbbidtsDejEADAxBpMsQOwvsNclx
	 rvXgILErMeZobSD70IqEbz0+I2DJCHZHjQvBvvzsSM05n96k4u7kcF1aOWeN3GWbsZhhK
	 +fPMrewKqzdIsnEb32/im0r/2X9mN6iG4SF2/EoEAnJDYjfWzZM0Pse/Oz5gg0lS20HTe
	 ZIvhypLfkSpbbTQ6hZmEqFarcIFySdEk6Et7MAyiLy5bKW6PXuXOWnr8TYFarS/o3zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794818497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=P3nMcjWv+xj29nx8pWfGlhho4ATOaCrbxLj/pbD7y/Y=;
	b=aRausYTIt4Zb2Pv+oeR3zTFkKRoNBxB1pq/ev32Hulfl4H3AjOLzyDKQkyHa/TOZvk/C
	 t9jzLDeaj4xlfV0WFHSFvxzt1zqVA/1nqMqHm0oh9Ctmrj1cY/QiZlP2OKWVzo87UsVkr
	 naYG2CTNbeBoG1YTgKALc6PCD9fKZPDyets0+YLFXooluuKyz1hD8G9Xvkzww/zDIMaso
	 BCGiiPyHcPTv2nT7ldS3SwZDldcbFoEvKqd8XAmt9w5SdlkSYAHr37Hqj1u+QbJxEERGL
	 oP3NWU/rZ8HCmyfop5+91aq8SwyWprA5H1L7YOTFA9bMl/ckCTfGUk8rxG4BhyDElEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZP00IxpJ;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B01606A32A
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 08:41:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7B01606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZP00IxpJ
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4946589267bso394370f8f.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 00:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794818495; x=1795423295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P3nMcjWv+xj29nx8pWfGlhho4ATOaCrbxLj/pbD7y/Y=;
        b=ZP00IxpJab14kKuRe88DihMZ3sUGLLnAMoZbx6Kfw/eLGuEOaKx/tjV0jOXIOl3pQZ
         Uj7XXlwgBYHGEFZDvny58xVO230lxGiGvctM28rK3d+IBntRZxpQPLZUOUgw63x2iwKs
         jHaUfpoqubX4l80Db0RtAhYQ/O53yLrYu7P0rhfryHreBVsprNjewnuwhGfIzZTleO5w
         HSTtY+8UBL1aWSM+9/b3UwVyTx+hsoHZ4+DKhotoGZISxO8PgLuqLeUIY4M7Jo+1zMc9
         iYmYe4Sn442PJKjCzAbuRm9fSjl4FszpAWcaaeGvBntjfXbCVaYuRS/VmwAwGmsiAMmG
         Zrjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794818495; x=1795423295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P3nMcjWv+xj29nx8pWfGlhho4ATOaCrbxLj/pbD7y/Y=;
        b=n2Zr9+CJUIoghQZJLYRF9FvBY97Ih+HNb2xH6HInlYUohLK/LYEcr4XDmYPxaoxl8b
         beSpIff/vXPaay6i5Fq6eMLO8y+qvgGSpE2KSMUSr+WdJzwmQWeZ2qX7h1clguGy29uc
         1EHkaiRL9sjIwTanzAPoQQxq4ycZlm2bWQbYAfsaoqytoMzGV9wk4UODhP2s6B8gj4cV
         +6L+NWiwhLaswJjJbaqMf1pDtY2aHM72CPU9zFcfBSO74YXeODj/gxDgCobNAX7fRomv
         C0n1do1FDRn+v+b/i2JCu77/bNGSLBxET83JXPt65i1F/kohsuc7GTA22wreTC1eHlim
         UFJQ==
X-Gm-Message-State: APuU4Z901FUXUHjp0zglyhcV05L6cPncS+bSrThUQ1Gv3EhUxT+X/aFu
	E6Cw3aooQ5uNUF/Fldby2QMMizEXx2vSm7BIJe1PVJUw95CCMxJlLhXE
X-Gm-Gg: AYBFou0OoSK6AZfR7WfwrMmbttA6OuX2II22nou4L4DyPzRPZkBav3VWIIvZ40qCIK9
	bKgXgRHo94PuMeEoNG/t+D4CJY6N4/hBdWrtgot+wnMggW7R2J73sxe60gBZurmXvGXHV5nLthn
	wmaXluIDZuGnsWIqxcGBfvOl7GLt+Jgcho/v4oj2/7dC5ju89DraU28eTQfrEBCwoPD3+TmCsI9
	2ePyG/f1XT/E1+iT4u2Mj6P+Z+kotSoOVUSSKEa1B0aCTdRw/58aeujvoazYcROS9vCiBgW7j0O
	Db+ZFdyQxyWk9jXKSNYwi8CO61FoS1kK+5iEuVaOu3uVaBz22cxWpFepWXvrMXuRu3Yg+x8gc8m
	NsD5u6GJbGUySzF0jxZDsX8y+pI0RUghQPTJ/2A0IS6tNV7B7mdv1Xs0d/KjRV/SLGVJq9R23F6
	8+CQYX6QmGGGPoQb0k6kLX/xhTpxbbJVQB9XAlAma45vrSF6cAf3TFM+q532vGxQV4oLb/zBsR7
	2Jl5YylB26m6brqsBFueJg8zyNeceMCGUVqi55Q2TnLje+rFad5MhCTtf1ReqFqu7BxfLW8gjO1
	m80rFfs0tYPGcJfVqk2nEFVaGvRDI8XoNUo1bdCARB5rofMYx+p0kJJPMKB5U9yiBTRXUZyn
X-Received: by 2002:a05:600c:8a17:20b0:4b6:2242:d0be with SMTP id 5b1f17b1804b1-4bb5599b367mr158884065e9.0.1794818494950;
        Mon, 16 Nov 2026 00:41:34 -0800 (PST)
Received: from Nuel20.localdomain ([105.112.221.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb62d5ec30sm284300555e9.15.2026.11.16.00.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 00:41:33 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: Tianyi Gao <tianyi@cloudflare.com>,
	Hangbin Liu <hangbin.liu@linux.dev>
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	kuba@kernel.org,
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
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH net v3 0/2] selftests: net: veth: propagate check failures to exit status
Date: Mon, 16 Nov 2026 09:41:05 +0100
Message-ID: <20261116084107.6675-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAG4wq-cd01i7YrcFPmma=BXUcwn_PK=wneKW=vyEBYzQ3Bn7QA@mail.gmail.com>
References: <CAG4wq-cd01i7YrcFPmma=BXUcwn_PK=wneKW=vyEBYzQ3Bn7QA@mail.gmail.com>
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

Four checks in tools/testing/selftests/net/veth.sh report failure
without setting ret, so the script exits 0 even when they fail. Fix
all four: chk_channels() plus the three "bad setting" negative tests
spotted by Tianyi during review of v2.

Changes v2 -> v3:
- Add Tianyi Gao's Tested-by to patch 1 (thanks!).
- Add patch 2 fixing the remaining three checks.

Changes v1 -> v2:
- Correct Fixes tag to 1ec2230fc721.

Omokefe Emmanuel Onanaroghene (2):
  selftests: net: veth: propagate channel-check failures to exit status
  selftests: net: veth: propagate bad-settings check failures to exit
    status

 tools/testing/selftests/net/veth.sh | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
2.43.0

