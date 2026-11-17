Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939378;
	b=a9c260wllqg5lj9mBJ00PLNB74ZbqpfjYZE6b0I7mTGqRTM4JT3dbHAql1p/Xdp+jAZM
	 lTRzSPmWExAoPsHxHNHJxFwKZIwEInCY3yyGGxdlMt5lWO8m78M+HihV9vOr+G6FdPxer
	 xjlNmlBNM2sYPGwEp13KQiOM1efyXZhhG4p8bbxQY8HS3J3ej+n17SB3AzFd2GmcwT/K0
	 UEzCOchfXP5CsUjnNeTc8NvR2oouS3GjwUlqQDYhDj+uEqTD8WPUm9/7LHqw3CYh4UIVn
	 Fs3+NuBR23wUttj/HqYbo2RWsFG5x//WUnzSb+U2qFpWE+Vqw/r2dL7e0T9OPMsaxbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=G3F1D5a6ZABD/Ct6UJJ0a/xHnccDHKfohgnWBX8JTZo=;
	b=sJhxpYl+PPpflrRu33wBfDTSVptjOAUzoMHUfZizNpT/qMzru+nvSfNjgxClvhHG8Ox8
	 SQoAeif95oqA1G0nM41xkOaujWJG4gsGHUp4OmHukNhrGTusC1qv2NIx/6cekwZVUadLY
	 ijtTkmS0A2stwWSVOHcuQwgR/+e5hV+TU7axVgm2ICBqEZRMj/LZj6jpSMzYtyFV4x7dq
	 o4azbst8QhJ4hkZqEtfiaGvd1SzD/94k6jhsMQRcSG1I/6/O0gFmKh9+1gHov2MmjEdWQ
	 I6MB1nm6yQYZHqPPJHWUjiBgYxmoKRsLhQeAsXWIuNAsDeOqcArNBpk/OF9Jmn2c6ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=FqQ862oe;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98DD606A32C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 18:16:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C98DD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=FqQ862oe
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b757029223so220161a12.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 10:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794939376; x=1795544176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G3F1D5a6ZABD/Ct6UJJ0a/xHnccDHKfohgnWBX8JTZo=;
        b=FqQ862oetmz1K12bF74clKD6N1+dPa/uE3WY/3hPfxyjvk19FalxbBVFypbiwog2Vr
         c4T+iwR8gTiPjsGK2SFczq+LS+oSAX4/8jCqj1GOut8VR2FHRFQ9z+VZCfDPl9Ks7oh+
         P2n5gsl4OpTBPGuhQyUoyMpmpfh5kO2SdRzRcDeUoxHpY96ie5sh4erhAuBm4HRVlaKX
         UedtR6XkOXX6CjXIyHql0Qe+/6HO7dPw02CjdIjmVH8VYLtZmqS8Zn7Ypt2RddjCvNNg
         9CXHEN0eoaJNPGIhVWhWW5uizVU99GS1pTOUki/iUc4U8l1apn4mQHorzxuCHZqHi3nI
         SakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939376; x=1795544176;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G3F1D5a6ZABD/Ct6UJJ0a/xHnccDHKfohgnWBX8JTZo=;
        b=pkNsY+TanVK9qFyQzM2F6nMZnYrEumvBd7SzARkIkCK72hGXpKuGcf57qfdA4ipcUS
         P8PWkCuRFu7Gw+gLCqA63zGhz9gShOIOwnrRn+sUDJAdP1xO0JEon2LMceVqL7UQ/CtJ
         BUxdVtQd9yohUtZaaTD6D3puQCnsx+CA1uBAphbvyzJMajZhIsq++SHf7TFDgLIgv/M2
         Iwa1glWWvjNokTLTLJu26HqhMzFQIBu38FG5giltM1XASMM0SzYPmAftio8m0renKdim
         4CVP1rrr6wkDFjU73iy7+PudEliuRrWGs0qtX5iUnF3mWzTTCbzECzJvfuiSfnLZOLlA
         ZeLw==
X-Forwarded-Encrypted: i=1; AL+hErFZ/gHN51mxSOa6sq0bfoG/DcPcTEzHN9w3yGFIvZSkefk/z5BgOBGsLAz9D7lAD1bWty8Y/2c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lkOE3RuWPjXm6Gqjnw2wpJF8W7AC8Q7x3foe9pzdTRykJSzgf
	96VrvUzfCM87wryE5rNeAlkw3FgYDdzwY1Hj3xbl4Xk/kjqJ7bLCKSF0d6tjFJPhOyc=
X-Gm-Gg: AYBFou3mEJweNJPuPIJdwg4+GJaFv2yzGwm6rXm7pLxJeb3D2WQDCDQju/ERSnc9Lv6
	Vx500tciQmcEB+mUS0/B846c7WmJicUNDovkvaiyBTjVh1R5xsl9w6Nd5FXF0PlqiLTpFnvZuqE
	Mh8bXZzxRLvUSNE1wYlQtjHckftQiMdNhzMu1dOhHvqesLrCd1QGM4c0IMWAvm84G9oS4PnX50j
	Apm7svQRFptuYuUnjbd3wVHlBAsjNjwOulCXEp8qWcL0WfmcfNY2+saDM3nbmtMz9a5SHKF/RC2
	gqUr3gaxIRT1B/bOKctaJE2ZwYdysQC+NEIxyOep9uIfLgLaS7aiGI+qrZ671MmowKFWyvUuP0v
	DG7RsxQT6T0PAOn+P8NpmIOtP9GsW4iUg5BSOlvZRQkwzOHAsGS0Op7t6BdLcl7CK3Rt1ewPcuJ
	rcvJzTQLevBZGcm17NcFpqKDbAqIx7bUz3RD7K6muu52zPWE0o6+yLqgWYVSyIOvP4uM+9RlHjY
	we/zqbA1oCPaMxEGhssuAsTADbZutPNqktBBp6MDNI4gdOZYvLxLTncXuwEftlN/CeP+2dkWBCw
	1ew9pr70f7pYBoaaE1ieA2s3Be6IGepdYp1DwjkmH62Fq3IPalNzdBpuGNlXsWfGzJsb
X-Received: by 2002:a05:6402:2341:b0:6b7:ce4a:7cfb with SMTP id 4fb4d7f45d1cf-6b887eb69e5mr71531a12.24.1794939376195;
        Tue, 17 Nov 2026 10:16:16 -0800 (PST)
Received: from L9JK9NPFH9 ([2a09:bac6:37ad:1e5a::306:c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b886a7d7b2sm93434a12.6.2026.11.17.10.16.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 10:16:14 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: Simon Schippers <simon.schippers@tu-dortmund.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Toshiaki Makita <toshiaki.makita1@gmail.com>,
	=?UTF-8?q?Jonas=20K=C3=B6ppeler?= <j.koeppeler@tu-berlin.de>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev
Subject: Re: [PATCH net 2/2] veth: wake the peer txq when deleting NAPI
Date: Tue, 17 Nov 2026 18:16:06 +0000
Message-ID: <20261117181607.30219-2-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113104648.225983-3-simon.schippers@tu-dortmund.de>
References: <20261113104648.225983-1-simon.schippers@tu-dortmund.de> <20261113104648.225983-3-simon.schippers@tu-dortmund.de>
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

Hi Simon,

On Fri, Nov 13, 2026 at 11:46:48AM +0100, Simon Schippers wrote:
> +		/* veth_poll() can no longer wake a txq stopped on a full ring */
> +		if (peer && i < peer->num_tx_queues)
> +			netif_wake_subqueue(peer, i);

I have reproduced the stall with your script and repro_delay_us 2000
(stuck after 14 GRO toggles) and confirmed this patch fixes it (all 300
toggles pass).
It is tested with veth from net at 5e9b2ad9b838, as a module on an arm64
VM with 8 vCPUs.

Reviewed-by: Tianyi Gao <tianyi@cloudflare.com>
Tested-by: Tianyi Gao <tianyi@cloudflare.com>

Cheers,
Tianyi
