Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.73
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795436477;
	b=VpC35MbK3TVjlQ98TQmsca6MqXf6OG0SUGfYE4W/Z+QA12MUWIicharsCZStZgL7kF0R
	 4K158mfwG9xmqeHtwiuyRfjsv73u8FrGqFQtP+KIWjEMN7kmSwb4QsENiVukqMuIJce1b
	 X10BNKMU8YIvQiY0TldE9+WtfJjoYAsgFZiae2SS6nRd4w2BLxgZZ4CfWRqv61rW3dP1+
	 emOiFJ/KFwXh3cSQk+M4l0pkW4TCJW9ekPZeoSWAvnV/pD6aCC7shjmoR21Gx2kvKSO/x
	 oqfFWinsytUOi89xGRsxP/4SM1x4rWNhEjce4ed2Tfrqg1py2zt7TewpkyYRW9g0qEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Ay5I4+sCRAfeVS8O+FopI5KJXo4a0ZrixBFvv+xDu8w=;
	b=t1nuMR0l1jX0zw61mdLfAjMsNPvXOVR+Rsx071+KIn7TG+O/0dd9KUgebPlcN1FP0wdl
	 wmDKWkdsIEt3nOhRuJHeencmqvgdLw2h1Zi90extmp61TGqkoeoBus3CQLiLYwt3IN9El
	 SIEIaSLfmmnleZSmCBXxm6ZEZLX6PHnxr35ht4zN3LrjC6Vlw3IGFRWdJf4+TvP+qx4FR
	 IXEHg8/k/asJvd2kwINc3E5AxXhNtkaqpCsXY4xw6EfTbVZUNuUOQPWlM0Lv9UWsbCiTL
	 FluiSWtnOitkbeJqs9OOXA5Q34SzpGgGheqE6HgM7Aq2Y85jlZdDnYW/dQpDUQQ8Kiw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Emwi46Br;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.73
Received: from mail-lr2-f9.google.com (mail-lr2-f9.google.com [74.125.230.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D6E606A32A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:21:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6D6E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Emwi46Br
Received: by mail-lr2-f9.google.com with SMTP id 38308e7fff4ca-3adfc43e68aso5184401fa.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 04:21:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795436475; cv=none;
        d=google.com; s=arc-20260327;
        b=REOCGROJWtlw1MdpE46iUspHP2q6AElXDIU8G2ZIdwfYaaj5Sn5XoJwnVSX/hxoohP
         dLVV4hjPfR8Fq0PCDyIf6oJb1zN5gyBtp1tQjfGh/uPr7l2Wy2rPsWItwF6NsnaakJxi
         04v0QFwkx92P95dT28T9mF1nDu/SgRdYCjFpcndKrzp80KLda01cbgxasO8qdhN+jbrF
         CK24eWq5Swb9AazJ3JIpaYquUMjz+14fZAzd6JN2MQVtlHE61JmUVcnJXZK6BqaCFI5S
         Mdg++8qjq40eCNurHcUffnFVB7W+ITIlvc33h3tJ7O7ZqhGTwxaKHl0lpsRuwVz+ir4G
         +juw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ay5I4+sCRAfeVS8O+FopI5KJXo4a0ZrixBFvv+xDu8w=;
        fh=NrtrZPQTSzMzqve7GQXd2rD7uSuyECBNB36N3rqbZCo=;
        b=SE1ZVTMhDkgJN1TvTeEuxg9qMC7E7TIBjqbOHmsA2ChuH05Moy3S8LPnjr/TaQdgph
         3jGS3l+RBfGX3UKOxrboqiqEN4X7UFJ29PtJX6hv/t6+7VoUoFnsehZo4gCmJGAqeU1H
         31c/NgA65Oii4w17N2zx9jPSXAfA5KUeSL5DVKE/fbIrwCYxWSZ8j8jOg/CO7VbIyEvK
         LLVjNVVJWcJKkivOf1Fnzdlr+R9jMXfcICXdQWBswaKNWdeIYEnjRE+rgLsnuUTJVsac
         KXg+E/nS4lf7u8npi5HyAMmfE6HFm9JDLUiy5zO+GNNdIKLu380o5C8Qvg7IHnPVD/yy
         U/Kg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795436475; x=1796041275; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ay5I4+sCRAfeVS8O+FopI5KJXo4a0ZrixBFvv+xDu8w=;
        b=Emwi46BrguZ9AxQbwZAX3BAkNYoT+LlXKP13L/H7XvxAMUQtrcNBo2/38s+G+1d9AB
         1YLu22WZvdyDDcNeFOSlp71SVPJUqt/ZmRxV9aHs8KtwWwJAYEx54o7bI3O/xCgFdQS8
         JKI9RRmAdGpEqteTHAd2kTpPuF4Zxi2ezl5baJfP9x/LgOxJhN1rNtrDuPKTBM9TJC5j
         KMifXHuyCDDpgXdOjZZT+06RX7d4PLCdNysGEXdcJf+k8G3QQrMcWNzOh/oEP3Wfnnt/
         DAAGTWIZv9V8i5hwZNSzqjjRLpE90/y4nM3U4OCYfIcT6jkIQIA4TxrJbgnn1n/9vTA8
         UAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436475; x=1796041275;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ay5I4+sCRAfeVS8O+FopI5KJXo4a0ZrixBFvv+xDu8w=;
        b=e39kOwRhO4YtJsU+ricHISt3jw+qy3uO0U6BwAcaLd7ugRfU/Uqe/ncaQ4xsI7mhwb
         d7T7d+Ko/TPrsZ6JlhZLLOvK0AESRWWP1XLq039Ay8k8jhJLtj+pAmQsRz2H4J8pdZmU
         0PpST8k4jRPH6t/1JyqXS8sGY0VZGuffUrHegio6atn0KW7BQtZ2gGG2/BH5zjRIr/Ah
         V9y8k8gblKGva7fEMP3H8dg70eujDI958VYoCMTbpG6Ujyj/X1pv+ELPKOBr8Gq+Os3M
         ZM1Oax1rJbYKFJcB+EVYzzk2qN2LmvqtckwNH5fQhM6kLr7tiwdbg2T4XrzSWdYthy6L
         2luQ==
X-Forwarded-Encrypted: i=1; AL+hErGOpyoAk4AION6APeFcYGcmmywzNI1O/BKjBTDjMFnkMWA8peeBM7TCn9wa9IYMu9I7yQhk54A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FjyOk2uKSz3eCwvhGmzi7QtZpVkG5h1Pks0nWGmMavrjGsQMj
	QFLqUHJ8sOC6akavloXJKJ7ap9vEnXKtPPFP/v8IBsH+YuQ1q8jmEOh12nG/mIN2olViFWjoAQA
	qyZQNtH6T+gcGDY7pYx73pcSHGKRv0DQ=
X-Gm-Gg: AZFdTZd5uBhmT1quBEGo0/pXx21mKDMFC/5K6/FS2Yjcb+xGse7tK62C7ymBWC0gsO9
	1Gp6/9TR9B+o5io6z0KpFP+o1KN6D0BUFWjj7XQs6THINoaopO/MQ/n+jnegjKFyb9iuwYWo+j3
	LF7PX1H70vvnhluydwgt1R0XFrLDCtmU972W/zAGEocp8ivRED+KFgZ9jmW4PjSBXWgKQwXVsza
	COlAKWtdQ52F2Vf/vcvP5tqGm4uvSPFKXItTiHax+4MSci1qMvD79A7a7Bxu/mMkjeh8Xzdu9fA
	GyRPSedTiWE3e/epyES6vaYyiyXQmYXKm93s0GKZGnQkYf0gueaoSSpjuPRegXcTd+yco4TIJsl
	MOdHqDZG9Aeb0bUN0Q2ygIbrVrh9Q5+i8GwzXaw==
X-Received: by 2002:a05:6512:104f:b0:5bf:ca51:e25d with SMTP id
 2adb3069b0e04-5c1bc85debcmr2916194e87.11.1795436474484; Mon, 23 Nov 2026
 04:21:14 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122002633.584362-1-yuyanghuang@google.com> <77c1afb5-3a1b-419c-a36d-660c464ad307@6wind.com>
In-Reply-To: <77c1afb5-3a1b-419c-a36d-660c464ad307@6wind.com>
From: henry martin <bsdhenrymartin@gmail.com>
Date: Mon, 23 Nov 2026 20:21:02 +0800
X-Gm-Features: Aa3M54pyJSd3MratvxY4xj3immss5r_8_uYVho-_SEDv5ZXhMrrt4B5cxZseXXY
Message-ID: <CAEnQdOr60qSvvi38b-E6yh2RJ3vzu+AS2xTsd7nBJGkY+BLixQ@mail.gmail.com>
Subject: Re: [PATCH net-next] net: zero hw address entries on allocation
To: nicolas.dichtel@6wind.com
Cc: Yuyang Huang <yuyanghuang@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> He will probably send a v3.

Hi Nicolas,

Thanks for pointing Yuyang to the existing thread.  v3 is posted:

https://lore.kernel.org/netdev/20261123121325.3137049-1-bsdhenrymartin@gmail.com/

Thanks,
Henry
