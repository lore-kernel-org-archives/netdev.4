Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795747277;
	b=Yq+B4+XJquaVMknF4GTlqCSjudUhDJKpYjGpjbcUmcPjfHB4oqrWFVi7I2yx9tqviimJ
	 3Tktb2bMgtKhlO3VgywFRo6CMtiA0yrynWeqIjGeRt0JV3YEzk6iYOJ4W295XvuknlAhc
	 Nn9hUnsfvxm/IAFUEoRU5g02S/sGBwqXzRVFy1lDuIvCrQaCCq6qjHPToN3u3vsywWRY7
	 h/9WduW9ZkQZ3PGYrxfoj5qsVsuFw7ySOiCiqC9fF5tqWa3geOT6/SKSPRVLBGZ1N7vFe
	 MzZFvXLb3d7GCX+fhBiWkmGh4tnY1H7zJDWhFFlVSUEjUIKYWnAjIAHOVsagINaw+9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795747277;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3O++9cFaFQX1xStaQ4AA838XUZsWOaUKNYAROFpPYxk=;
	b=HmAFoDnCcI3RrwR40tfZUXda+M8y0ByPvNitXb0wd+qeilgVpSPmDkYPe3MOmF0JaniE
	 ObVC9l/Vv2fIy+3nX3uZNRKZky1/7EGNv3QGiGU8uvUEU2GYDH0+XHHaHn/VxvN+xW9jo
	 oTVJqPmnX/WEjzM2DBiqWHcfLG6yaEMATIQR80lK3bqlCeX/NqcAuv6OhA5UVNO/jV1se
	 r7BTngjh61pVlzWJse8vY6q1co7uKolK1i7jpVH0//MBDkPXEc7EAZtZ+Iostlw6E4/Mh
	 KrRWJvvfBtXnhC+RVEromRxdYVvnkEk6Jiw/Hy7bROLCTmPuDTYgl2RmJYKz7G/Yn2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=jsoFFDGC;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1005A606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 02:41:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1005A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=jsoFFDGC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=jsoFFDGCXuxkmfLAwLMHFDBwaWTuD7F+kDtUIUkXYCGf/1NyHQm88N2ZoESxjT2ZzArqBNlP29dmt
	 e/RfLcNs3Nb27Jp8h9K95h//rRYeVZ8qnE6VaFtcJQiR1b+i67f/cbi9las4vyb0Z3O5uhN6kmQU3X
	 3PLEwz0dcQTd61og=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26b08edc9799-9d0d7;
	Fri, 27 Nov 2026 10:41:13 +0800 (CST)
X-RM-TRANSID:2ee26b08edc9799-9d0d7
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[223.112.32.189])
	by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee36b08edc8228-0b34c;
	Fri, 27 Nov 2026 10:41:13 +0800 (CST)
X-RM-TRANSID:2ee36b08edc8228-0b34c
From: Hongyu Guo <guohongyu@cmss.chinamobile.com>
To: netdev@vger.kernel.org
Cc: intel-wired-lan@lists.osuosl.org,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	alan.brady@intel.com,
	13057616121@163.com
Subject: Re: [PATCH v2] idpf: fix vport_id used as array index in MAC filter async handler
Date: Fri, 27 Nov 2026 10:33:58 +0800
Message-ID: <20261127023358.258140-1-guohongyu@cmss.chinamobile.com>
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


