Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795060039;
	b=dVGWQA+TuCTLjCKOgRXRAI+1nFmCPSsjTW1tO45JK73Mj4I3YJkHQvDjs9BDM+hNp5+5
	 VGzrVRdyg8VEdhzguyTDeJ70etFjKLZPdPyuejkROjBDP1dAXH+AWMsx0XqDiI4FvvNpG
	 Vef5IQgABuibz6Wn43VrTGNgR8wPJ0VGWivoqUkmkqzZkS4fpYF6bUC9Q5EED6OX+MGh5
	 flJMF6k0OYyiZYBkw4/KGSMdhpx7PNFxWqwvwBanAuGTT0qXVJHWU5bhNaW9ZnJRmcQvM
	 +pWgmcHHv+J1mkzSDn4W/FLy85B1Y1RVd4TYCnbQkGdNOxbjPMNiTrKTRLPmWBpU7YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795060039;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=Qn7Y/UAiNGU791+vODjKEy0IVC05KOc5WN3jSdGy5u4=;
	b=eu4+UUjmls3ZFLtgILOU+w0zkkfsTydIPqdb61P8uveoLUo+vmb4Pbxdbj3WxPoFF1FG
	 bFWW6bFbA52nmPw4ldoMZyshKkaIukIA7oMa9hOpLfVET0Ab7UDQCZzk95W5Vl8w5yA+m
	 MRpXJCfvzQAgK/SNrbIpKJtX0KrFcT3nyGQphmW4Oqm1k7qmP7pGUQ9Bnm2WWitgsHEOq
	 +7r5Mu/7nxy6zi7Zmv9juGLWO4TgDAhZlRNqoLDjDjBszbLSYKkr1CUgHXgWunkqEvIsC
	 khKb9Ko4jzlAgGmfnfh5AK/o4lMhoNjAeH51IigVCe0xVeJYUOnaOD7WPZr5Z2SKabQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xIqQHGvJ;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1D4606A326
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 03:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA1D4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xIqQHGvJ
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e9995ce866so13916425ad.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 19:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795060038; x=1795664838; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qn7Y/UAiNGU791+vODjKEy0IVC05KOc5WN3jSdGy5u4=;
        b=xIqQHGvJRAskOW1idjimcMs63tWWyuebQyn7ph+/sSl+CvRyDhqCEGk72sAn/NrU66
         +uzYV3mQLpObMWSz968XMXlFan8AHFtCYRW/vmnNJQ4BG0RejElrPNHeFEFcMf0OAAfm
         L4l+qr7TA8qZZfl1XAKIzGEIt2eb0yjygDJqWGBL9i5ncBqKIChlBQAImFZW8nNYgQXs
         Ud1XPFT+iijYO2rEA83dBGA6ry1HM9GNIn5oLan2y8fUU40XJTUAltj17OxCi4NoGJ1t
         T+aFTDDB796KzrDHrlwN0W6D3Ngf0MIgWj992Cj+XTwFaYdUF2lYl/HK2vXCHf1gGGpo
         uYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795060038; x=1795664838;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qn7Y/UAiNGU791+vODjKEy0IVC05KOc5WN3jSdGy5u4=;
        b=TVDeTzJXqXb5JPUx/Xxqg7gECmSP5VMu28BqDaQXA+TVrshDwyfNrQhLSCFdEhf6zY
         1LpHaH3C5TuRJ+eJFPXLvOMvtPLy9RuFTsO23r+dzqpryVE1D5Q/MNCtbQ9dFYDEKQmB
         GMScCJ8n2jRvk2Ebd7FbDk1KljzoCyjhU554L9i/QqKmV7CHo2w3YFI1unguxTY5Akxd
         jkvWZ3mfVRN/FzC1/Dz1ktqYiUQZxZp+mXHA64XGJ7/X4dLgBJRNAYp/kr+FS4L/6ox2
         DRp47fHL8FvBp90jBg9gs9bgCOc73H1nyvfbCa4/lhzoiBzS/BkI23G/dWFtXL482OIq
         7xHQ==
X-Forwarded-Encrypted: i=1; AL+hErERaniPXtJOS/UJM32ERnvdfiCRnn6itnpS1V96keBUk4qaqdVnS79kBs2mLYS6HfcKeuBCi3M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Oyz7TFYd0P/cZBaAZiZy9ElFZdx47cU2OUu8fWbMy1UOQMoJ6
	2aDfOv4oOTvRo2zOarxqmijr+pS4EHQiGZaX4gZHrVf33b/VdTGkWJ1O
X-Gm-Gg: AZFdTZftA/XRZtroAb3eELRvh442ACiXrYipLhJJMXO5rRxOl/Eq81+W62NiBIVU6qP
	62Y3lQKfKQIkn7hfniZaARz1ZHcjq8ov8g2ArMgaI1NeSGjYF+GIxS+MRw9iFAnZtczGSa1BPxz
	HTsqHzsY0XOUzAFyEj2o0ECrUPYRMd6WLqvIrbmlQjS0J1RG04ebhjADecH7cvmxe7hOnaQ7sD/
	auTeB/P1up7MXgZnPqVDitETM0dJNtCWi+jpah2vA+Grc/tdhtJD0U/sQivE1J6YrYIn2gv/bvi
	YAeWCi0jy4u15mJBqqy5R6PeOsP4qaczuLLSH/wAQnxlHDtu8MMk9bt+fmeegxV+OjxNRGarnUJ
	0EMHZKooMZ1wg49aT22zdxJ1ft7iuJxzuLiTomsQ7YbYoAfCUTd/byy9Ih/XSahcdw9HmLnXMjA
	KTOCjRfQAtiVMwhlpMYtQlrGnibZqzP0lI/z850RW/UxUuGUifMmXP/lv13meYAIaK1lPrjIQzl
	SMdu+iAxz7EHcmXfILJzMTuoq83LvezujlxSuTOvSfxEtUiqayvfvykLhqWRIO705pgw6BQ+RP/
	2Su980NxL2zSkiTDW9b+8k+APXQVS7Gx420hcqjIvTjvsXGg3VRLNwjAiEzyTgG1C9u6EZYIU9d
	dx4E5mcA4RGY9w25DafDrESQsx0MERRAnF7k=
X-Received: by 2002:a17:902:c40b:b0:2f0:25ea:8fba with SMTP id d9443c01a7336-2f025ea9dbbmr6830545ad.25.1795060037981;
        Wed, 18 Nov 2026 19:47:17 -0800 (PST)
Received: from localhost ([153.61.198.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f027c10a3bsm2490365ad.70.2026.11.18.19.47.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 19:47:17 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 03:47:17 +0000
Message-Id: <DMYVOCRSECAR.1WZZONX4K3PYF@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Rongguang Wei" <clementwei90@163.com>, <netdev@vger.kernel.org>
Cc: <willemdebruijn.kernel@gmail.com>, <jasowangio@gmail.com>,
 <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <kuba@kernel.org>,
 "Rongguang Wei" <weirongguang@kylinos.cn>
Subject: Re: [PATCH net v11 1/2] tun: run the socket filter from
 tun_net_xmit()
In-Reply-To: <20261119032242.71919-2-clementwei90@163.com>
References: <20261119032242.71919-1-clementwei90@163.com> <20261119032242.71919-2-clementwei90@163.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, Nov 18, 2026 at 07:22 PM Rongguang Wei <clementwei90@163.com> wrote:
>  drivers/net/tun.c | 93 ++++++++++++++++++++++-------------------------
>  1 file changed, 43 insertions(+), 50 deletions(-)

Why did you lose removal of exports?
The changelog doesn't say why.

pw-bot: cr
