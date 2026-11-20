Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186758;
	b=bvkvCojwMEIuJZ3zjVGnXnA/CVtp0cnu5pCZeF1DyHuSws0QbEhGAVHOp/ouz8UcwNBU
	 rqtuYDP7Nar/o/UxaD0h6F1027qoNloFe7P/m60mILw+s1GSm8k7RsvdXH9U/EBRml9Wa
	 9rs23IExFruTfLuBfXrlqf2XxfI/maqxWNbjlD2h6UMCzBLHHkX0L/KSoUNiWd0OJJpPa
	 2hhK3ILb/988+8kRntJRRU0rpc42fCjkgcLRg0pTu67ZOsg1HIgmpSGAFj/aoaCl8bBHD
	 G9fa86qGgQpNqbnA80wZDoITHBj49M+ptaalYm8YesOLwV8bQoVXwlfatyLkv6VIVDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=swYxzWf5VVARgWiORetPyRqONCj9VdpGStrv3wX4KxU=;
	b=BbX+Yso5w2Gd8I0hybz/fV3BF3hjluBqt24Sn75QapOksgT/7tcw+RoDPkbDz+zshtcr
	 ayHr2dvb+L0jLVuR9mgb0nlrEWov8ayriP1O+b8cwLp60g9OP+53sQdJn3zsaOElfCGmJ
	 BpIklEmBzvM/tVHHEMuYyjMf+Iqe3KxTClvgcyrc3urCX0B+cUNR4EEgJoky49v5Qh6qr
	 w501SHYiQiThBHxstNpkpUSA5Ag55ghsNy7MxGDfwWty8lOxvJCrKFEYIwrz6xK669ujs
	 Uz/KQrsEy5z1pCGOuRqAymDkO2IJ4d7o2+FQHykZ4Z8QEL891BjfpRGPpe4owtnz2lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kEnxlnIA;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9617260A2601
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 14:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9617260A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kEnxlnIA
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e9d7791b00so8845685ad.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 06:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186758; x=1795791558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=swYxzWf5VVARgWiORetPyRqONCj9VdpGStrv3wX4KxU=;
        b=kEnxlnIA11QPdxy0xiNbjI6WmXRz927tNWoUoSR0Dqr3zS9xINUl7tQYwDqtFs4MFt
         YqvUMTg9rhTVQFalZhNbws7euOL2qa4+1r44/m3MvVfXc7Da4ZoZlEXdy2o3ZVQydQhT
         3zfDpv5DuJjpWpKzKI9qYM9Ah+POJWywuB2bLm5jzz30E0BDXd++/6sr8d8WZpZc/+Nm
         o8MqC/0WDUDlk8m8HG+aU7s1I7K6vQVgFPYIWBHHqp+QjAys0BzcwAcgh5nWVqjqzi0K
         loLaERpCb6nZDJDiS3nqRbCfyipcMuuNrkc/SXt8gIv/+od3tTxpm4erpjJXX0Pduwox
         L5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186758; x=1795791558;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=swYxzWf5VVARgWiORetPyRqONCj9VdpGStrv3wX4KxU=;
        b=Joy7e6+pfncLjOoHYSum4vGs4RHVRZjVwI89bHVBDIckKfVJy13nW4EtJWHTcz5sws
         cwzC7kKJnuHJ1t0BguJvyr7+nJshRpmDYkqdShHY29ct3KBi5QO9tQCip3P1QhFRrP1p
         cjItzLlyjlIfL6PaR9LkCZ3gNdujza5m+M01hpZsUywdh4ffFQx2AfeXhp9Ba0kbST9Y
         l6yU5nw8NXvw8tpLux/4E6p78MYYrriZgXvA+ME+dg6/N2ZSnU3/gl7rMnsqwXa0sC22
         66gQoy5NWjDL2cB2qSoAoOe4aGJqdkpGCsanghhivMmkt4bzvmhXcG8Hg1VhVP48/ODO
         A77A==
X-Forwarded-Encrypted: i=1; AL+hErEgTj3eobX1Z+Q2cQiCm9jfD30Vkv6VJnsrgJRNgiKBD4x3ldnZawp0M1GLj67QLgYvkRejN1U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/i+rBQO8q/LG16MSK/sgGyBJefyMVRNXBX3dLwoMFGHYo6yN7y
	+INMbLIPLyszhQ77G0OGwxQ/q5hgOyNUSztG0I55PuPwzPUACPTr7BcK587MWBxRlRA=
X-Gm-Gg: AZFdTZfxvw667XwvBvJSxFMlFHc5wHcrDJ7YSbziMq9EH6hVFT5Vn1wFX9a2DC5VfnP
	f6wF3zso+9uda1zRba6ZAiB5Ll04+UZi/WXuS4CIcoNZWTs2SkdXfUMny1RkzQV1TTqhaA927I3
	NprxkimStkjq0GAqoQtWyKVzTAQX7OVVLYZ6TSvZTMxOX7ppUU6NznoeRTXqygFxoTRLdadZCPF
	EZOIn82WoRVrii6ca+U1e4o9bbKRhPXwFPlzNDBqiDmS5slrbIhL8P0AF7+PbFByIhY2qD5XkbN
	KsNjUTR6Md0H1icCFDXs9sgRW5t+WmGng4ZQ+/1CF6B7ju+RwBgu3+2BwJut/iSJ8zRKXPOk2ME
	NzKwcPOcDabl9e4NyQQdVjONhccnASFnalJVUph9+ZjGfPJzh32DsCScRLFFJHy3f5TufcVRaNi
	joMbYExMOAD+YbYFC2Ms1fvEGEanQlGm9TVSUs4isBjXlfxEdyYu56OdDmXsHeJ79Om/vYa4Ult
	c5loOaD4g5SLERkY3K9i35wEj0dFdQE0BsjY7vHGkrSWof6DPNtUIPFU8vdHXQwi7xikZ3GLvB4
	UG9eUgwbkxCNVDbwemgE5lMEnXP2HUAWVAJ9Eg9lhyr7VRUCdGDJIreyv3tXG1uwZrxLirNfT6l
	IZERc9SK3Cg31CMHxw7+ZGBtZYgA7SSOwgeat
X-Received: by 2002:a17:903:94b:b0:2f0:3618:f170 with SMTP id d9443c01a7336-2f03f1acb10mr31323285ad.66.1795186757992;
        Fri, 20 Nov 2026 06:59:17 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1058fesm15977965ad.48.2026.11.20.06.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:59:17 -0800 (PST)
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
Date: Fri, 20 Nov 2026 23:59:11 +0900
Message-ID: <20261120145911.3127855-1-yhlee@isslab.korea.ac.kr>
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

On Sat, Oct 10, 2026 at 02:53:58AM +0900, Yehyeong Lee wrote:
> The buffer ID in an address/length Rx completion descriptor is a 16 bit
> field, FBNIC_RCD_AL_BUFF_PAGE_MASK being DESC_GENMASK(15, 0) once the
> fragment bits are removed, so the device can name any index from 0 to
> 65535.  fbnic_pkt_prepare() and fbnic_add_rx_frag() feed that value
> straight into fbnic_page_pool_get_head() and fbnic_page_pool_get_data(),
> which use it to subscript qt->sub0.rx_buf[] and qt->sub1.rx_buf[].

This is superseded by v3:
  https://lore.kernel.org/all/cover.1791775409.git.yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
