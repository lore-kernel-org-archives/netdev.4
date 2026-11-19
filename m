Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795068363;
	b=tMG5crCN40uStwWpE9rPusCbfll2VwFHZfa0kVfjaLwAt8rGid9lRU+wDh5MiPmVUYbS
	 rfWqi6WMq9ChKlEdiVTROeLtjtgaixslogbU9IXw0i8jdXHqurE+iYNJXCTtuY5rdiAoz
	 0BOUkcSAONLBNj6aYad1Cm7MsrAp5bChAboqlhwbhVi9u9Q+EGy+YBDal7qTWPCZfncfM
	 DggMKDBhHdxGgLmOaYXobgm9vf8f34B1dwme+CG3GmP29JsUwpmDrH1ZIp1W7BJguNVJ9
	 +X0TvjdgecUnuTlKNXPsZD9A+K+WzRYYj2MQJMG0irSi1zseDijh21X0mXIEtFkp5aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795068363;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/5rIHAfqRqd8MBoUEzsiuW3HhhEoDxIjxePKjQSRiAI=;
	b=pKfOiLdTdJCmauhAQonNtQLfsTkLaFKH9EXbO4d9st0aqP3QNOkzqSavoMSp2u3YBPtt
	 3MZOOnhPRVrrIRY5eI3RYl72li5xWbBg2jhQuAygc91V99+/SURm3eF1U7tgVShR36mK6
	 jRZDp8w9NJCOqByhNb1DkNKHNPyo17n0xlZU8vXp4ANQe7fuRam6xsp+ta58vsggiYiTL
	 2bjEjQCqqDqmSbhcE4kHFakQOa72VT1AIKSpXjW/YIjKZilMR3sCnCRpcziHqZwyp//2N
	 fep6VF89Kltui6vEsdKVzepgzz2eneBEIm1t4siwSdNuL6DqoW1O4HH7BkyT/z7UGFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Qkwx0+12;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A350606A320;
	Thu, 19 Nov 2026 06:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A350606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Qkwx0+12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=Qkwx0+12pC61tyHlcsA9ASNEWJjUEADOCqxYfSbMcLKZeTE/4nsTrE9QFCmwAJw//VgI7U3Gr7S9/
	 2FNEnXKO72B/eD88BjfG2MkI3V771vcLyXMjDOG6FimFMcLocU//trzR7Ko83mXeT6E8qI/9aTpoYq
	 1bJxlHy7jrrcrGLU=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96afe91c70c0-1fa31;
	Thu, 19 Nov 2026 14:06:00 +0800 (CST)
X-RM-TRANSID:2ee96afe91c70c0-1fa31
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76afe91c6ea1-f1aaf;
	Thu, 19 Nov 2026 14:06:00 +0800 (CST)
X-RM-TRANSID:2ee76afe91c6ea1-f1aaf
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: andrew@lunn.ch
Cc: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>,
	chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	olteanv@gmail.com,
	sean.wang@mediatek.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: dsa: mt7530: fix regulator leak in mt7530_setup()
Date: Thu, 19 Nov 2026 14:05:58 +0800
Message-ID: <20261119060559.658-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <7c6bcbbe-bcca-4294-a54c-320b26a9d3da@lunn.ch>
References: <7c6bcbbe-bcca-4294-a54c-320b26a9d3da@lunn.ch>
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

Hi Andrew,

thanks for the review.  For the record, this replies to "[PATCH] net:
dsa: mt7530: fix regulator leak in mt7530_setup()":

https://lore.kernel.org/all/20261118014114.1855-1-laixiangwu@cmss.chinamobile.com/

On Thu, Nov 19, 2026 at 12:36:27AM +0100, Andrew Lunn wrote:
> > Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
>
> Does this bother anybody?
>
> https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

The quoted subject is the exact title the commit has in mainline: the
"net-next: " prefix is part of the commit subject itself, Sean Wang's
2017 patch went in with the list prefix kept in the subject, and
"git log --format=%s b8f126a8d543" prints it that way.  I kept the
tag verbatim so that it matches the tree, which is what the stable
rules ask for.  There is nothing to change on my side here unless the
stable maintainers say otherwise.

> It is unusual to have two different goto labels with return. Normally
> cleanup is structured similar to the code which went wrong.
>
> So something like:
>
> > +err_powers:
> > +	if (priv->id == ID_MT7530)
> > +		regulator_disable(priv->io_pwr);
> > +err_disable_core_pwr:
> > +	if (priv->id == ID_MT7530)
> > +		regulator_disable(priv->core_pwr);
> > +	return ret;

Agreed, that is the better structure.  v2 follows as a new thread
with exactly this fall-through cleanup and a Suggested-by: tag for
you:

https://lore.kernel.org/all/20261119060424.1476-1-laixiangwu@cmss.chinamobile.com/

Best regards,
Xiangwu Lai


