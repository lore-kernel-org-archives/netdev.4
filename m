Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795573786;
	b=LJe3e8guQXryTXoyY3UPJPt3ExrYA5Ju7E+1HiUPLPXFPGFUIt1UaIZDsvUMzLrLms4M
	 PQVCxGo7+g7r3LmtVbuzbHttBmd+cE3UBefhRvAfDR/PiGWOCeev8J9bHmAcjDJ/2fsv0
	 7eHuPlCvn4Ffh45SP1TEaQhXjEEM2cnp+A8eAOG5tk9HVPwNfCXd3N9o0RHmet2oqTvDT
	 FQy1Ha0EpabgOGrCUIfwKnctlO1AdQCib4pezpGMCcYE2NwaHXeGsA5cNEHjooFUmuJOY
	 tUt0M0WOjouC1pBOH6QUbKU5+G+5JJQez1PZ972XoiONFkc373cUR2ZSD/xorzMAvtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795573786;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=q52TT/lMyy1HJphmWNWNVNuFZcOXXg42bzRuSWJyWs4=;
	b=PHFQwi1eW8ez8pESmf2tlsT7cD57K/oStOWM0E8lcTMqZyShdNYNpXnDLyy4xKPqsuJp
	 +0ZFkMcRZJvYfUurqaPHX0cLd1vajco+T64egmBWdG7c2sp2qaT5vAj2rj16eUX8CpTiL
	 Dd1sW+FZiGRDQZJSsllaRQpI5z8uVhSfTx42ZzeUuh5RKAFWqIE34yygJWeJA3o+X6vYv
	 lAStxbbN3ahD7JMs1ceBJukJSP1mOkOLskB6oQb6izBbbGt29u/a9czfTNw5J3HIrmIeo
	 fgehHoQp22Qq27+/V7H6hkPqAZcPTmCIeE0Ab0WRmoLisS1vkpEqOp10UoIqS7e/KJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b="ls1Gg/2i";
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11E09606A33C;
	Wed, 25 Nov 2026 02:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11E09606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ls1Gg/2i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=ls1Gg/2imTYH8u1lS49pqBVCC1xqiOD2XIQIZGPwaXkheNAK7dGNUg6aM0ZHNTPtmpzPitotMcIMR
	 4wnK+M+4TF+tBAKJ08WR1HZqjDIs3EdNwEdvSDU0AP/rL9jaWvDMkzC+5szYpDFberNOKtQKxfbQwH
	 2GZSXoR63LL9hu9M=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66b064817dfa-1939e;
	Wed, 25 Nov 2026 10:29:43 +0800 (CST)
X-RM-TRANSID:2ee66b064817dfa-1939e
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76b064816f58-353d8;
	Wed, 25 Nov 2026 10:29:43 +0800 (CST)
X-RM-TRANSID:2ee76b064816f58-353d8
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: netdev-bot+sashiko@kernel.org
Cc: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>,
	chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	andrew@lunn.ch,
	olteanv@gmail.com,
	sean.wang@mediatek.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kuba@kernel.org
Subject: Re: [PATCH v4] net: dsa: mt7530: enable the regulators in probe() and unwind on error
Date: Wed, 25 Nov 2026 10:29:41 +0800
Message-ID: <20261125034000.1936-2-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20261125030000.377-2-laixiangwu@cmss.chinamobile.com>
References: <20261125030000.377-2-laixiangwu@cmss.chinamobile.com>
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

Small correction to my previous reply: the v5 link in it points at a
Message-ID that was never sent.  The correct archive link for v5 is:

  [PATCH v5] net: dsa: mt7530: enable the regulators in probe() and unwind on error
  https://lore.kernel.org/all/20261125022231.1936-1-laixiangwu@cmss.chinamobile.com/

Everything else in that reply stands as written.

Xiangwu Lai


