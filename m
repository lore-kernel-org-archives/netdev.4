Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795747221;
	b=y52OSyBnaiirsFDpUc4exqzUuduB31yxnpA+epLljCcvKUi58w9uFXTtH2Jm93Ergdl2
	 mLZse80/tOBnppsRteQLBDaRV0mW0Vn2z9ljPkwUZIHjbEhO0O4rAIfyC2gq9J7GQmYwX
	 qZnZRfjxffzN2QhwUEF3675obSGbREFbFd+KZwUJ5j35lEZjgin/D7Lp5ZvoINoH64z5y
	 LP4NW5suiSnVqsOQpvREhHFODmti6+FoxKf0Qibzrcw4pupikAqB1GM3Dc3QH0D5bYrb8
	 qYqok+mA6UG6HXS71GG4CphO64vdNo+GSSE2JtgjReebPqtDh/utIdFN6bVRXG6eQZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795747221;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3O++9cFaFQX1xStaQ4AA838XUZsWOaUKNYAROFpPYxk=;
	b=x12Cw/FjXUTp5zwA6EdzG5ZZ+wZH1Y9fLu4K//a69jh4dR1oVVbrG0cSWPmyj0V4NKRD
	 OKeJHvfr8DAznG3OveyzHXglr80z+eg2lQRPSn3WKXmb9U2U6xTMqrCqlwHTrZZoN2ahk
	 fRjWV5KlOPGUt8Pm+6Kqa2XbPobj5PXLlQMWe8sA+uMp/nYgj/t+VZthwmX6iUa1OtUvJ
	 ibu14C7A6DSeyaxKaQrWyg/VxHCZnJx8/+OFqz/i8j6lsUezc/mWrWDqVvpaibKM9EZRD
	 urQw8uAXKV5zGHmJ2L/apmZAlDlNFyuYJzQSvmxejdx+qs6BmKhGby7UOtAhbyoecYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=VoQ1j+Lc;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24B11606A321
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 02:40:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24B11606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=VoQ1j+Lc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=VoQ1j+LcGGCNpql5SU2c1GW50pDluITHYJEKGAhh7QuT7sGt3bw0dIAV0cK6LZ35M5Q3j6ZHHwsI8
	 YHtBowgH7ECrKn2Q5qh1JqpBBHYCj8HsJrUAvviZZeB48ynBdluKyz8bzimArjADSUlQgdbNBYBixQ
	 nwxIQsa0msJiwYos=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86b08ed8f205-00cc8;
	Fri, 27 Nov 2026 10:40:16 +0800 (CST)
X-RM-TRANSID:2ee86b08ed8f205-00cc8
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[223.112.32.189])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56b08ed8fe63-82ab3;
	Fri, 27 Nov 2026 10:40:16 +0800 (CST)
X-RM-TRANSID:2ee56b08ed8fe63-82ab3
From: Hongyu Guo <guohongyu@cmss.chinamobile.com>
To: netdev@vger.kernel.org
Cc: intel-wired-lan@lists.osuosl.org,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	alan.brady@intel.com,
	13057616121@163.com
Subject: Re: [PATCH v2] idpf: fix vport_id used as array index in MAC filter async handler
Date: Fri, 27 Nov 2026 10:32:46 +0800
Message-ID: <20261127023246.258100-1-guohongyu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179574583226.3135.4850818709708500001@kernel.org>
References: <179574583226.3135.4850818709708500001@kernel.org>
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

The Medium finding is real and already addressed in v2, which was
posted before this review ran: the handler now returns early when
IDPF_REMOVE_IN_PROG is set, before it looks up or touches any vport.

The Low finding is also correct.  The old code did not just read out
of bounds: when the device-side id was in range but did not match
its own slot, it removed the filters from the wrong vport's list,
and when the id pointed at a slot that was never allocated,
vport_config[] was NULL and the handler dereferenced it.  v3 will
add these cases to the changelog.

Returning the slot index from the lookup instead of dereferencing
vport would close the remaining window between the REMOVE_IN_PROG
check and the vport->idx read.  I can switch to that if preferred.

pw-bot: cr


