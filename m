Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=173.37.86.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620943;
	b=hgYxjGWJs2CvFA9yVCO3HkntwCnNW1nwDaRkbI8k6hrne/1aF1qNLbgIJdPRUT1Jm9Y2
	 R62zbRD9ikqwsC7knCOKQoNzFkBkDztbLuOaxc32pSPg+OdVqJ+kEljefpcZ2iAi+Wueh
	 yriN8V6omcemFTKefBVRc5FEVf0/4Cwt/ANIPzU9pRYua4HV7kTnRZbX+mhA0yua22kNO
	 c2LIJ8czzDhgvsQM3/L9BLzgE2CniujHwzzi7ok3OVmwQcjlprYDWwQYLkje9gZVTKh08
	 DYZ8xCw6ARZn6QmJzU5dgHiQOFdWzBEB/azTBqntCc7RIyC//bzJFm5GLkMh37JiY8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620943;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IPAS-Result:IronPort-Data:IronPort-HdrOrdr:X-Talos-CUID:
	 X-Talos-MUID:X-IronPort-Anti-Spam-Filtered:X-IronPort-AV:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Outbound-Client-TLS:X-Outbound-SMTP-Client:X-Outbound-Node;
	bh=HNEMSZJAc5ZY/I5OCWZFyMD+f72xZEg6/7MEZH6zPa8=;
	b=DOAKbJTKUcXNlGob/znpWE95JOhQyj4eJd1180eZ3fK1X0IyQXQJjWT8LSb4HB3fsWhY
	 cz4/K/p7UHxuV8IXAVPyHWATFt0D+XtWVQrb9zdHXdrTTTlzZteU8ro37D2R/GTis1sfC
	 hhRwNNhn1KFF1kOoygJmE7xLNzRVSf8X3gZwT++odqQIrFqG8uBdTCljzjNHKgQQGuHQy
	 i0gMW6XK5RlZRBUnix/MoDjIxqPDHOyhqEkwNmq+FNMMbApLc8sfoWQacb7jIoOB6il7h
	 7O++85CcI3b2q6v9QplEN33DvApXxR3pAMVjsVXW1uUGV1ubWdLWO89aHoKHmM4HxRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cisco.com;
	spf=pass smtp.mailfrom=cisco.com;
	dkim=pass header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport01 header.b="WZ7/LCcy";
	arc=none smtp.remote-ip=173.37.86.78
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D20A606A335;
	Wed, 25 Nov 2026 15:35:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D20A606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cisco.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport01 header.b=WZ7/LCcy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=174; q=dns/txt;
  s=iport01; t=1795620942; x=1796830542;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HNEMSZJAc5ZY/I5OCWZFyMD+f72xZEg6/7MEZH6zPa8=;
  b=WZ7/LCcywGG1q/irSKPfjK7MwDbya8TbvQh4WlBHfU3WOkAB0RYGf1yJ
   3A3uMRboDk8QQtx4kf1JhMCNwOs72/lPhA810Yu8HHqo6Pp0gGLIpvLy+
   pobhsbv8lgPt5yBHEVD/7SXM7JQeub6QTVoS+UoI9wIOFtRT/8CsqKMTF
   yNdr4ZtQYU261c+Ga8U1IXyphoO0gTdes79c1RhhREe9ueqEpQTpmbFbS
   F6TZQdNYLvbY+qgpzmZg7zKZd6A08JBNvLtjtvazYMYKcevvwzM/foUH/
   LKWdaIQY1rZbuOpwR3jfcOrrBSu6CANWRN8pKnv4mq3+wU7Cef2HHqZWi
   w==;
X-CSE-ConnectionGUID: d7a10+XlQzCDn42VvBL0zw==
X-CSE-MsgGUID: VInHqL63QpKsLcfRbT7Aig==
X-IPAS-Result: =?us-ascii?q?A0AaBADL/wZr/47/Ja1aglmELEO1QIF+DwEBAQ9RBAEBh?=
 =?us-ascii?q?HsBCQKOIgImNQgOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGX?=
 =?us-ascii?q?JATAgEDMgFGEAtGVgYBgxSCdQO4VoIsgQHeSYF0FYE4hXSHc3YbhGMnG4FJR?=
 =?us-ascii?q?IEVgnsxPosJBIIigQyZBEgKgRQDWSwBVRMNCgsHBYElEDMDIAoLEhIYFQIUD?=
 =?us-ascii?q?RASDwQWBS0dcAwnEikXEXYbBgUSICpAQzArgRKBA12BKyhdAQIfRi0VgXUCg?=
 =?us-ascii?q?lGBI10CAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDFsMCAMaBRomA?=
 =?us-ascii?q?h8IAgsCDHQoERATHRwkLwUZJjwbCoEMJx0eGQ4CKQYWIQs0GA1IESw3Bg8ZB?=
 =?us-ascii?q?D5uB5Y8giaBOjQrpg6hEYQrgWifdhozg3EBEo0UmVuZCCOkOYRqgWoCOCuBL?=
 =?us-ascii?q?jMaCBsVgyNSGQ+hYQG/HSZvAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:1l+pAqnMp4OfWTLGb5q3bATo5gxTJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIaWDuFPfyKamH8edgiO4y190sP7JKAxtZmHVNtrCBkH1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6x9yQUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNsf/b8nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FYFH878vQlFKz
 O4zBDZRNC6drcbu0q3uH4GAhux7RCXqFJkUtnclyXTSCuwrBMieBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTYD/7C7pm9AusrmL2bzxDqFGVjaE2+GPUigd21dABNfKIJ4TSGZQJzhzwS
 mTuwUX/Igg+aoem0Rme1nmivOXzwgr6V9dHfFG/3rsw6LGJ/UQfAQMbUHO3qOe0j0q5Vc4ZL
 UEIkgIjobU3/V6mUvH+Uge+rXrCuQQTM/JQFPc/8ymOx7DS7gLfAXILJhZCddYvnMw7Xzon0
 hmOhdyBLTVpvKeYVjGb+6uYoC2aPTUTKykJZUcsVQIP7t/iiJs+ghLGUpBoF6vdptn0Hyzgh
 jOHti4zg50NgsMRkaa251bKh3SrvJehZgg4+gnaQEq74Q5jIo2ofYql7R7c9/koEWqCZkOKs
 H5Bn42V6/oDSMnQ0ieMW+4KWrqu4p5pLQHhvLKmJLF5nxzFxpJpVdk4DO1WTKuxDvs5RA==
IronPort-HdrOrdr: A9a23:y9cNo6DdsNkfmVblHemM55DYdb4zR+YMi2TDGXocdfUzSL39qy
 nAppomPHPP4gr5HUtQ+uxoW5PwJE80l6QV3WB5B97LNzUO+lHYTr2KhrGM/9SPIUDDH5ZmtZ
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: =?us-ascii?q?9a23=3AvdiVW2q0FCQGM6fMVtk0s0jmUcx6eySFj0fUGl2?=
 =?us-ascii?q?TJWA1EoOLY3vI6rwxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A+Y5W7w/xxv4B7wCPFmmnGcCQf/lJ5YS3LB5WqI0?=
 =?us-ascii?q?loO2POxZ6B2i0jTviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,233,1787011200"; 
   d="scan'208";a="550049482"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 15:35:35 +0000
Received: from satishkh-l-mj0bbv6x.cisco.com (unknown [10.25.129.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id BC97518000201;
	Wed, 25 Nov 2026 15:35:34 +0000 (GMT)
From: Satish Kharat <satishkh@cisco.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: Satish Kharat <satishkh@cisco.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sesidhar Baddela <sebaddel@cisco.com>,
	Aravind Dhanasekaran <aradhana@cisco.com>,
	Reese Faucette <rfaucett@cisco.com>
Subject: Re: [PATCH net-next v3 0/6] enic: add V2 VF receive control over MBOX
Date: Wed, 25 Nov 2026 07:35:26 -0800
Message-ID: <20261125153530.1716749-1-satishkh@cisco.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118-b4-enic-sriov-v2-vf-receive-control-v3-0-2cb25677aa8c@cisco.com>
References: <20261118-b4-enic-sriov-v2-vf-receive-control-v3-0-2cb25677aa8c@cisco.com>
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
X-Outbound-Client-TLS: ANONYMOUS;unknown [10.25.129.52];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.25.129.52, [10.25.129.52]
X-Outbound-Node: rcdn-l-core-05.cisco.com

Hi,

Please hold off on applying this v3 series - I'm working on a v4 that will
address some of the AI review (Sashiko) comments, and post it shortly.

Thanks,
Satish
