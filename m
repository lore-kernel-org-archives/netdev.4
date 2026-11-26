Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=173.37.86.80
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795669941;
	b=SVmTL4Wm6NmfxrPzn775+E3ViDEovYDNewWj+aR06gYLhT48OMDZ9cnnIW/8/0ftEHkD
	 X4b74YTvbfApIqjar8W8El9h8Zz4Xm7s0CuTZ6jVS6wCBfn4zXMRtNViieBPIH9pVcsAW
	 TAYiGlYFt+O3ay8/0juiLnr0/RqSuZ1VsrRfTBcMxRgiekdS4A/7/D8MlF05SQ6Z8iAhw
	 PwyV4/6y9p0Au2O42PZon3DNL1ru8vbmw+n5BJMvkJD+g6ZMDHwFG8y8MXMwTBivXh1yf
	 paJBUZR0Me3F9aoEcwGeJyYPw2XjdE9Sr8emv1H+c1Pf9XJ8QRMs2sa1x5TVU7BWSPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669941;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IPAS-Result:IronPort-Data:IronPort-HdrOrdr:X-Talos-CUID:
	 X-Talos-MUID:X-IronPort-Anti-Spam-Filtered:X-IronPort-AV:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Outbound-Client-TLS:X-Outbound-SMTP-Client:X-Outbound-Node;
	bh=Q/3U3z91VSWyDu/vf5BKlcNzmHeVvr9/M4blrzhYU3s=;
	b=10yrlrFDEN/DIvRmUL65/K++3DX5giQzZP7tjELG+IoLY6LUQizsmd+oOiqSshbkDZU7
	 gwOOGIWtqGTAOZ1fGKCn4wK0TfqocZTEYv0rbz7vH67Mjx0luus+1ijq2bUf9lBcHgYlR
	 N65Dt79360ZkuHveyWRVFGLpE++XduaFgfJh4xyirhPVkXE0S0/Ifh6Yh7iCQmOLVgHy6
	 r9APwe+UhSumYv1I2VgQ+PbF3xa3HxJ78iaKRhfkA3k1S+YZWA4xWQA+cIhnAVDmFldIG
	 DgrWcM01vEMxtLwG/x/bINgLcNzrbuRWZO9+Gs7DC2/MHnhMSLR/k3bMhdiYarnC79w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cisco.com;
	spf=pass smtp.mailfrom=cisco.com;
	dkim=pass header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport01 header.b="XHnbQ/a5";
	arc=none smtp.remote-ip=173.37.86.80
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E091606A334;
	Thu, 26 Nov 2026 05:12:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E091606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cisco.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport01 header.b=XHnbQ/a5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1946; q=dns/txt;
  s=iport01; t=1795669940; x=1796879540;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q/3U3z91VSWyDu/vf5BKlcNzmHeVvr9/M4blrzhYU3s=;
  b=XHnbQ/a51Bflv/gFFkoYoIjgDAhLDbMbOoSqKqx7UYODXJq+XN7BIckj
   A0JFICHhrlVWmdBlKMLjgUFyKf9yGJKzOGyIf3vf5obxNlzXef8tdwPqL
   Az0ZUUPpf/FZu/bWFdL0nRs+A5TwozsPHKi2anGhw6fKACESnxsQ60XY/
   ejnBxv1U3CcyhssjDGU3f8zWCYMWKbP7JpLhSgxrjfOm0HSu0dt0VxtcA
   xvpxH9l+ejo1SUCWesuIF6CtyJnuoURdNEXZCmyXqvyuCdYCAhI3fXy8B
   o2TB9CYwPr188TaqOHOlheScSzR8NhbvxocpuKtMZKlaQtdbfKiu1qSqq
   A==;
X-CSE-ConnectionGUID: L+s8vb81R2WQskFBtppCPw==
X-CSE-MsgGUID: 41MsPthWRUeavuXjpIJd4A==
X-IPAS-Result: =?us-ascii?q?A0AlBQC6vgdr/43/Ja1aHgEBCxIMggULhCgEQ5cUA6AnD?=
 =?us-ascii?q?wEBAQ9RBAEBhQUCjiMCJjcGDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4ThlyQEwEBAQIBMgE9CQULC0ZWBgGDFIJOJwO4PIIsgQHeSYF0FYE4h?=
 =?us-ascii?q?XSHc3YbhGMnG4FJRIQJBzE+hB+GagSCIoEMglaWOEgKgRQDWSwBVRMNCgsHB?=
 =?us-ascii?q?YElEDMDIAoLEhIYFQIUDRASDwQWBS0dcAwnEikXEXYbBgUSICpAQzArgRKBA?=
 =?us-ascii?q?12BKyhdAQIfRi0VgXUCglGBI10CAUlBDgdFUwklQxJHJCIIEgkBExosCoEaN?=
 =?us-ascii?q?TwJJj8VDFsMCAMaBRomAh8IAgsCDHQoERATHRwkLwUZJjwbCoEMJx0eGQ4CK?=
 =?us-ascii?q?QYWIQtDGA1IESw3Bg8ZBD5uB5ZHcw0vR4FkOis7kwAUkj+BNZ9chCuBaJ92G?=
 =?us-ascii?q?jOqc5kII6NpAU+EaoF+JoFZMxoIGxU7gmhSGQ+hYQG/HSZvAQEHAgcOAwuBa?=
 =?us-ascii?q?JACDxcHgU8BAQ?=
IronPort-Data: A9a23:KZ87PKk7lgSQ6tbpzXKrg6/o5gxTJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJJW2GDOvzYMTb0L9F/Poiw/UgA6MKHzoI1TAFkpC1mQ1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6x9yQUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNsfzb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05Falb4bZpCzEXz
 6YnESsOQDqfn/qd+K3uH4GAhux7RCXqFJkUtnclyXTSCuwrBMifBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTYz/7C7pm9AusrmL2bzxDqFGVjaE2+GPUigd21dABNfKIJo3bHJgPzhfwS
 mTuoz3cGSkGNOOl9DeM7G+chPfuvy+ncddHfFG/3rsw6LGJ/UQfAQMbUHO3qOe0j0q5Vc4ZL
 UEIkgIjobU3/V6mUvH+Uge+rXrCuQQTM/JQFPc/8ymOx7DS7gLfAXILJhZCddYvnMw7Xzon0
 hmOhdyBLTVpvKeYVjGb+6uYoC2aPTUTKykJZUcsVQIP7t/iiJs+ghLGUpBoF6vdptn0Hyzgh
 jOHti4zg50NgsMRkaa251bKh3SrvJehZgg4+gnaQEq74Q5jIo2ofYql7R7c9/koEWqCZkOKs
 H5Bn42V6/oDSMnR0ieMW+4KWrqu4p5pLQHhvLKmJLF5nxzFxpJpVdo4DO1WTKuxDvs5RA==
IronPort-HdrOrdr: A9a23:ocBdYq1S1JtwK0QEh4LbEwqjBJIkLtp133Aq2lEZdPWaSKClfq
 eV7ZAmPHDP5gr5NEtLpTnEAtjifZq+z+8R3WByB9aftWDd0QPCEGgh1/qB/9SKIULDH4BmuJ
 uIC5IfNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: =?us-ascii?q?9a23=3Aas7tc2k2Wj1wFYAy3lFjanRM2vXXOVme1yfOKR/?=
 =?us-ascii?q?hMzxWcaaWZ3WM4LtPq9U7zg=3D=3D?=
X-Talos-MUID: 9a23:YdZNxwYMc8x36OBT62bJnwl+NPhS3qmnFl09k40nmcXYHHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,234,1787011200"; 
   d="scan'208";a="549915289"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Nov 2026 05:12:14 +0000
Received: from satishkh-l-mj0bbv6x.cisco.com (unknown [10.25.129.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 90DE6180005FD;
	Thu, 26 Nov 2026 05:12:13 +0000 (GMT)
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
Subject: Re: [PATCH net-next v3 6/6] enic: configure V2 VF receive mode over mailbox
Date: Wed, 25 Nov 2026 21:12:09 -0800
Message-ID: <20261126051209.3558558-3-satishkh@cisco.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179539393186.3135.6117001594095681852@kernel.org>
References: <20261118-b4-enic-sriov-v2-vf-receive-control-v3-0-2cb25677aa8c@cisco.com> <20261118-b4-enic-sriov-v2-vf-receive-control-v3-6-2cb25677aa8c@cisco.com> <179539393186.3135.6117001594095681852@kernel.org>
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
X-Outbound-Node: rcdn-l-core-04.cisco.com

Thanks for the review. Responses to the three medium items below.

> permanently-denied exact-filter ADDs consume slots

The behavior here is by design. When spoof-check is enabled, the PF applies its
MAC policy to the VF's secondary unicast addresses as a single all-or-nothing
decision for that VF - it does not admit some secondary addresses while denying
others. Because there is no subset admission, the exact-filter budget is only ever
consumed by addresses the PF actually accepts, so the scenario where denied
entries occupy slots and crowd out otherwise-valid addresses does not arise. The
driver re-presents the full requested list on each sync - the normal address-list
synchronization behavior - and a policy-denied address simply gets the same
stable-denial result each time, with no effect on the datapath or on the accepted
filters.

> ADD-only ADD_DEL_MAC request failing as a whole with -EIO

The current handling is safe: an ADD-only batch reported as a whole failure is
treated conservatively and does not leave stale accepted filters behind.
Exercising a whole-batch -EIO specifically would need PF-side fault injection,
which this single-host lab cannot produce (in practice the PF returns per-entry
results). I'll look at any further refinement of the whole-batch -EIO path as a
future enhancement once there is a fault-injection path to validate it.

> SKIPPED DELETE handled as fail-closed

A SKIPPED DELETE only arises when the PF skips the remaining operations after an
earlier failure in a mixed batch. The current handling is intentionally
conservative - it reconnects so hardware never keeps accepting an address that is
no longer in the requested list, which is the safe outcome. This condition isn't
reproducible on this lab without PF-side fault injection; I'll revisit whether the
reconnect can be narrowed as a future enhancement with fault-injection coverage.

Thanks,
Satish
