Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794789087;
	b=WE7zZFlNNp4u0HIHLOiK04s5lLr2wuR3TYX7ynhrPw6DbW3n0P99cVAVXJ/jX5Cyxpy4
	 V3mNeBeUoPGMhZuMZi/elfqXyfV2ysznHWRIyN58Jrf+SSfFt8koLjzaxx08wku2p6scC
	 WPE0tNkZX1ym0Erj2+utdz6RFDrNfYx89nh3owdsflNhIIfnnuen/kHk9Z0okr4fn/zjG
	 AtWTszZjJMlXaqKaUp8zLaZo6Okg4uqpzVhtRAMo4glcOJdWSA0ZQuGKhcbkLe0Ce752N
	 iUgiLskBqTfrLgTOuhql1JDP/ekHUruR2PsPYLGf0Qq9WhSCe6uZmVPDDPUdjClHjZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794789087;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=bHhnhvINNj6Bh3hfCB0d0sBnW9XQ7ZsU2yDvXj/6pto=;
	b=pJf4nXOW0619PTS4jvaQDU/zzny83lQa5Nu+B44+3J8TqOb5v6B4NxpVFQZFu721XE3w
	 wKzbtr4y5Th3veZ5SOt6+k8EXCkaylwBRh0BOFtaOCWWFNdroWtl6xfr6rhlqmaJuuMbL
	 fucZe3mLlxqXWXSCVA9/gtebg0bK/zlT9xDV9mMJVtl/656CNUt0kXwiTVQFj0z7J6ca6
	 9z1LvxPnq983GkAfJAQPZxPg7FO2JFXA4tyHochEVr30O4nupVtHlRA3WoPoZsKIcV/TQ
	 RwhffTY9ZFzxNw2FOdQ7rFq3Di0oj9tJJin9oNshZ3HWEx5cyiX7yUQwlox9imXhDjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=O69UVlOC;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 614EC606A323
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 00:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 614EC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=O69UVlOC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=O69UVlOCon86wBY4M9fkikHhMEBrksjRiT6jvv9nWXXfoUN3XodzmlJT+/Aas48FMAunj8HufNytq
	 ANSqobRGAKBA/pMPmuCp0lt75Oq4CMQfUhbyYfQ2qlfV9sqPSE+3LLRmU5xyKjMlQVLsXS5YSx8V1n
	 Dv8K06gGO7GEpAXk=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26afa4ed6764-3496a;
	Mon, 16 Nov 2026 08:31:18 +0800 (CST)
X-RM-TRANSID:2ee26afa4ed6764-3496a
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from [198.18.0.90] (unknown[112.23.105.246])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46afa4ed510f-75151;
	Mon, 16 Nov 2026 08:31:18 +0800 (CST)
X-RM-TRANSID:2ee46afa4ed510f-75151
From: Xia Yan <yanxia@cmss.chinamobile.com>
To: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org,
    oe-linux-nfc@lists.linux.dev
Subject: Re: [PATCH net-next] NFC: digital: fix target leak after Type 1 Tag discovery
Date: Mon, 16 Nov 2026 00:30:45 +0000
Message-ID: <1794789045128.4536.20054313275013163148.nfc-t1t-v2-reply@cmss.chinamobile.com>
In-Reply-To: <20261113103426.GK18859@horms.kernel.org>
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
Content-Transfer-Encoding: 7bit

Thanks, Simon.

v2 is here, with the release on the exit path and the comment you
suggested:

  https://lore.kernel.org/netdev/1794705795184.22628.49502335540847234602.nfc-t1t-v2@cmss.chinamobile.com/


