Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795748973;
	b=sotIwlJH9uPGTP7GVMs4r49LBPKrydC4x36TEGDf2tcj5bNFWpiatTQ2/T0e/voM/eKH
	 w7qvirg2K6ChCsITkTOxhQFfoUVUZK9OGc8+P5rzDKNABMkhtU3iR7SAjQJ88MZjMiMqf
	 cCizmLt/fz/L4VOOYtdSX3UurZYA2OltuRUqRM32578urrDmsH+CBO9kGu/RlL/AU2xz+
	 9LV+zmauTcbFL2Pu5ljfJEYZGD/oTgrolrD6SyovrnxNZUHdoaigH5coTttV3B7sWWYFq
	 jnYe2ARL7ZUvnhtBrOYXPYQHHvsptxj6Nj5NuIqekl6ZSL0DGeg2UVefSMolfJ2UxPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=lYdXgvNP0+osPYkNvp5kuJoWkPSjofQK2n2XC+K8pfo=;
	b=My5nSiUgmLgqHY/c2Y5BtVoSRZrscuu9WFGBCEHrttV6yv5KRuy/kM4JYGEoOw3695zC
	 vRrlnsRSTeYYrwNG/3cpaCO++OBnciRlcX+AfacsDITHEPc2X6HlGPFek1mAUSphf+WSq
	 r6ae9pKF19kldDw9x+W3Hkccc8jH/jD3O3oGahZVhx7AmAd5sO/ZclagXqV6V/yFdr/SL
	 82jIpKtmBkeVvVvdVcDqrJEKpRqG7k5IwXh1STvhrFL4Rt4cnUlhljkSmbCrvXdyZiXuu
	 bkWlRDQuC1xqKx4m377XVw0ePz0hP0fMfIAXApMLxyPcyFNtuMlUn2zZjzl4Xc1KgfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andrii.net;
	spf=pass smtp.mailfrom=andrii.net;
	dkim=pass header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=KB8PH8Fw;
	arc=none smtp.remote-ip=74.125.82.225
Received: from mail-dy1-f225.google.com (mail-dy1-f225.google.com [74.125.82.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2B8606A326
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 03:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD2B8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrii.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrii.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=KB8PH8Fw
Received: by mail-dy1-f225.google.com with SMTP id 5a478bee46e88-38644aedba1so11278233eec.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 19:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=andrii.net; s=gmail-2025; t=1795748972; x=1796353772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lYdXgvNP0+osPYkNvp5kuJoWkPSjofQK2n2XC+K8pfo=;
        b=KB8PH8Fw7SgTQKHOGbHoQOc+kp9UfGQLKkah0BG5SMsl7+YyD3yfrOo1szuMxsVfgh
         JDVvNuvpQ+hC5sYQv85XG+7NbrUnp6k7gVeH9CzWaRXyQffIAzDujsLObXfaLm1kJMYC
         hldQSy0znLpSteuiZ09fidyzBGCnWE4JS+ZpFZCSl0Wn8z0PTDM3Z3E/XrMdsHfx47/1
         htaN7bDRZpKdWqST/KLJObhT+GBomN0mug9S3X3cb4ALsnt01OaAMZxTEor3+iKppHmJ
         g0nQdb7at8godzHEgTXNJxhd4BOa7PZeBIx3HCsxHNR7jM762fhqMjAKJjPTAF9qoEkh
         fK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795748972; x=1796353772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lYdXgvNP0+osPYkNvp5kuJoWkPSjofQK2n2XC+K8pfo=;
        b=WmVVcDCMOOoVayiOVFznMTXdxEdXj5Yq+vUNEokTcpfuYfrew7Gr1mfEzzN9r8xt3L
         GsS7hRRIHSmOHEdHbcqRWZuQbooQ+gs747WFHUcYinEsAR7DzYxKWZLiObnl3AneKcno
         LVvCG+XT1yWThmLfaqTFAQMzEeOOZI6xEZMpNwSOuN7o/3Pf/Ab+GkN7Ni/DoG+7/oUu
         UivBsraqCMabwnofKaLAE+fCt2XooA9sNJD2avXShA+ULZ+vglbrzXWc5K4s/qC4GRUT
         BJdryvGjERCgw0IkEV0UTZKRcYvNGfDfphbWNJwyGZqZNDWLO4OVdVlp7y9VpQi8FqPC
         jlFQ==
X-Forwarded-Encrypted: i=1; AL+hErEg5jguznqh9h9eoa5b6LGAgY2xsFACnR42nSO3Quibvw71sFUIalwrMJ2k6jJ4XaISBTclWwQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Hxd1v8EFI3xxg9dEnYUcYo9H1ep8MRqSC4g4GWXRStfYiV4DY
	Cdm3KpiES+GwG+tdYVYVZsq0wlQk9Rp3Y5Y+6ZtEhUQwY59FGJLrzS3oWrfvTdyeAHysYhgn4DE
	dA3s7Rh/y9vicAewsOjB3no+gvhmFJWpnNqDb0qR4XJ3RkJvr35RJ
X-Gm-Gg: AZFdTZe9UhzW6/6C/9CgfGo11gUDD5+/ohbN8yzRRllJbbPSxk6/gZ12Q7UElLIjRXt
	vdQgOQyVkkTR2V95r/cvdMcbNaXCQXySqEU6H9BhInHaARuXJudR1EEa4/ZsknnZjpqdRrCmnOa
	NxebsalurC93RpOaue8d52Lxb7jARvOrHuItU1bzG8JyCVaUnmD2RuchyBxc2vR5OPTY5J7YrK9
	y60T6M0hYUK84nCUsuxwXQn06KijDGkJKfCyLT+GnfHk/izcJ/GuCZR6cWWTcRYoAaJW0WqJJzl
	EW0QWXf391AD/7cR/pGPi6oABxi5iRHpyb515lqkU2/4SSKGZi4gbFPW2TXqeYSMFM98ZTP6aoB
	V9ttJ3uwReA8tvusPx0mqlE8paZE=
X-Received: by 2002:a05:693c:65ca:b0:386:b826:407 with SMTP id 5a478bee46e88-386b826061cmr13259762eec.20.1795748971828;
        Thu, 26 Nov 2026 19:09:31 -0800 (PST)
Received: from andrii.ai (mac.hestia.andrii.net. [2602:f337:ed:4865:7374:6961:204d:6163])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-386c7c627b0sm1659379eec.23.2026.11.26.19.09.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 19:09:31 -0800 (PST)
X-Relaying-Domain: andrii.net
From: Andrii Tereshchenko <opensource@andrii.net>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Christian Hopps <chopps@labn.net>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	security@kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH ipsec 2/2] xfrm: iptfs: hold the dst while a packet waits on the output queue
Date: Thu, 26 Nov 2026 19:09:28 -0800
Message-ID: <47c34f93-d927-4052-acde-83a84e5ef373@mid.andrii.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <45f802a2-c639-44bd-aba0-5c81e2198c9e@mid.andrii.net>
References: <b56bbced-a8b0-4ae9-80b4-1958ea36684c@mid.andrii.net> <45f802a2-c639-44bd-aba0-5c81e2198c9e@mid.andrii.net>
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

Please drop this one: Nguyen Ngoc Thang's same fix is already
upstream as b88c75488ecc ("force a dst reference before queueing an
skb", syzbot 622de7e1f18a30fc404a). v2 keeps 1/2 only and follows
as a new thread.

Andrii Tereshchenko
