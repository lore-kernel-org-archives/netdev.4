Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095554;
	b=I5RO2j4AVIzmFP6m+lcYPIJ4EHgkEwXz0IfS4c+Yp5ZejjIuazhNXsOcJObwrdejC/uB
	 CI99906eZy014x5MR0oV0fws0Rwj8AVvlKulVOJeI3SoPMo0RayzEswGoF9tS8AfMZ02k
	 PBJWpCRKrlI9HwHHUTU+qUQjQvl2x1ikoBzayjaJ3J3IdVPocdG8XGe37QOoSdYtkw9kq
	 ax3AsfUnejWm8kCnCXhQi/cwig++Njn+X1nIpoG4zr2YxIO/cKh7pRsyQcHAsl1WuICCI
	 ceruKxHsDuZiOgGbdkTaAf24RWhm8DR+3WBaKl2CYUDn9RC+b5yrzMSY2b0tVT0jBMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aIKwF63+dLkhXsiETZIIUL0nQU8AYMomc2V+IHBLFfM=;
	b=NVmPQPaMTNdp7qvJPnv1Luew6/lC2BWvRLBpf3y9zpTh680usvtIXYcYQcX1l8+NQL4W
	 2iFF7eB+tAKKe5+52xC7iTWZHks/qoRXvfCOKjAX66jaFe96JiB9i61lfZ1O/S3JrQWFX
	 LSU34LZn3wt48o+7FwcVvn9YuNze6aUe4FeKepew+0ZjV5109PISq5soruIo6LbOQNSmE
	 48bWPW3G/jjrUjWilglYECcqY/+M1FGSeew217gPq261F713RBkvgZfBj9hzwOI5hdVAi
	 Xyrudd3S2VyxdkgBtZpI1OLCfs1IIW3AyHdJiTC/vI7FXU6zOMxdIsUzDjtz3tPhrOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NWy2jsoF;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24057606A325
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 13:39:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24057606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NWy2jsoF
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4d581da0aaso280530366b.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 05:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795095552; x=1795700352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aIKwF63+dLkhXsiETZIIUL0nQU8AYMomc2V+IHBLFfM=;
        b=NWy2jsoFK1vnzUMfFEHUzWZNjmpcS4rRtIf9Ox0js20yLgBEOViEnQ9zGt0rrZwVvn
         matT/XV5SqLvzThS3SH2tcjovn2ZEUKVbiuECMxpouCtGHYTKlcPtnRdPClzHOvtKtXc
         RTAaaPmQq1I2Gr/S6jYYu3Byl4YbmlIpzMV2WUCUnTklzcYOQUDPVWJ3R5Wt3Zbuv5Zd
         lCnkzNYj15QPLBvzmKD/hcQXV/RbLE1nUsAjcMKGaoobUdYVHVXpxVxuBd8NWEs6uMtg
         8yQF/KUF3h37p4nDqmDxIE54G5vmoI8kAeWv7yeABYAgXtmuugUYiklzfpo8/idv52xX
         wVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095552; x=1795700352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aIKwF63+dLkhXsiETZIIUL0nQU8AYMomc2V+IHBLFfM=;
        b=pufJXwjOfKr0wsWsUJbAaRdMKiZD3lnDuLNFY3oa2qYU9/N3jsWIhiM2crgJWw1sVY
         WX7fvsqqvWRHk/UezNUGCJDD+JtxKyHQtX3sAzeuq7eKLSQWtXIl57H0ggwo8bEQEq/G
         mVZKNyodbKmAfP0v5mCam+WpTLIhs3APBDgzAzRy1bRMUMnebxR7NV3JTigq9H5hvo4Q
         68KifavX/+mKvT1Xq5V4Q7tyYbdF6jW6UiKqE6FythxrxrkHEbQVtVaJao76nLnr5DbR
         hP0ATSKFe40BTyBMbkb1vxXFue+J1XQRarGOXxzR8NAM/Gfn/s9kpZbb7Az2btZyJADE
         gJkA==
X-Forwarded-Encrypted: i=1; AL+hErE8V+4J4FcGqO7uopucj1TUC+R3wL36IYMcJC5kl2mWsTcOPv4F6nUYssEfmaxwfi2F1NfhNl8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gTDf8MZiRRHrJIk20RsrsbO6nn04UMgWmOJCIdbE2+ZB3SOvA
	EohAgsN/3c+COAMYGj2VLN7vPIOnbCnQuO7fUrEw19Jzc9PtAwreMCvF
X-Gm-Gg: AYBFou2057+dGG213vaXwFUEwBnA2sVQpS4Sp+bKUsr9y1qJHdB505qh5JylQ3c9s4s
	w4ZlvlzNdm3CnAYtQwBqxVA4FAKksQLfRQLZYdw/zbWqEwv+RZS9DLHoEExq1BXPSmZALZQW9tr
	lTfXHgViFS4R4Qe0Wf96/2AUCfapT96DIVte3ePLOmtXu11Tc3KPgPpCK18iv759No5UzDsH5o4
	vCllD/qoeqJE6g+MNYVxR/8Tx2isKZSFMmKIBG67IdiQw7rn9eev+BUw4YfsQrXUyjuun5kBGgJ
	n57fJ+oWbzTBMNT9YtBPOeicFc8o/Nr9T5rR0hU2rZ4hxkaXrrb3mBDEs1Nf9aCM6/0fGavzLsd
	v3VUvRG4r7wypX0/YuqUvIsTsGgq4EfP4V8jaweae894O0cwlXkofHjWswvZh0x08F/ryzw55ny
	DqhLEB7uHV5ZdWFwA2fHhRizDPJv2StS4hAddPM5+dxT0ZoM6E0jJ5t839LvrriMmn/wtPjW6Ki
	dfq/bBnV5pV/CLErci1ZNiI7evpt0Iy5O2xzKzPuA8N/huwJCuc1onTzo7MJqyQ/7YE3+2jeJoJ
	ESEwFLy0+E4pdJrOff9BESL6MMDlqFJWcaE+OkVNPRBdyWA7MetbzlupLQuUKGWC2RUmcz15KZK
	99xMpmIW15d4DW4tNsYMbotKiM4O58c/uJes=
X-Received: by 2002:a17:907:1b1f:b0:c50:f0f9:ad74 with SMTP id a640c23a62f3a-c510e19968bmr620873666b.9.1795095551923;
        Thu, 19 Nov 2026 05:39:11 -0800 (PST)
Received: from VivoBook-ASUS-X712UA-M712UA.lan (user-31-175-182-49.play-internet.pl. [31.175.182.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5123517a4asm105408766b.82.2026.11.19.05.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:39:11 -0800 (PST)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yongzhao Chen <yongzhao.derek@gmail.com>,
	Alexey Immoreev <luixo-public@luixo.me>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 4/4] net: dsa: qca8k: bound the data of a management ack frame
Date: Thu, 19 Nov 2026 14:39:08 +0100
Message-ID: <20261119133908.12428-1-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118104104.26684-5-kuncy7@gmail.com>
References: <20261118104104.26684-1-kuncy7@gmail.com> <20261118104104.26684-5-kuncy7@gmail.com>
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

On Wed, Nov 18, 2026 at 11:41:04AM +0100, Stanislaw Pal wrote:
> +	if (data_len && !pskb_may_pull(skb, data_len))
> +		goto complete;
> +
>  	/* Make sure the seq match the requested packet */
>  	if (get_unaligned_le32(&mgmt_ethhdr->seq) == mgmt_eth_data->seq)

This is wrong: mgmt_ethhdr is taken from skb_mac_header() before the
pull, and pskb_may_pull() can move the head, so ->seq and ->mdio_data
may then be read from the old one. 3/4 takes mib_ethhdr again after
its pull; this one has to do the same. I will send v4 with that, the
rest unchanged, once v3 has been on the list for a day.

pw-bot: cr
