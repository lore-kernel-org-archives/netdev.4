Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=173.37.86.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795669934;
	b=O0wY7pO/vhliXSOctkGM4Aja83/kxRkR3YR4VVdgGDkFOHVEK2zbC76EeXWdCwzs9Aym
	 o7t8jZzRVtjEt7m+ogtbpTdjUwv8zhH8lAHnr2YN7qtSnqnh1a7deOb2+vUIwUIaBysLo
	 frYRvCsLsqmwN12j+kNGf30C5oegRb//EJyUddM9YVz189n7CFIGAoUBCAGCHKCpWTUKy
	 /H/UFKVIYq1W3LkUHPso0ouEa/+XQb9sDNgvzG5HuuLrUfIVm1Om4l4o8tmPhVpwf4p9E
	 z4H7h4g7dNFKAPlyvJv8qDDWr8BStY1ZMdKX1O8rTHqNX1bvt1U+j77k3ot515syVWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669934;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IPAS-Result:IronPort-Data:IronPort-HdrOrdr:X-Talos-CUID:
	 X-Talos-MUID:X-IronPort-Anti-Spam-Filtered:X-IronPort-AV:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Outbound-Client-TLS:X-Outbound-SMTP-Client:X-Outbound-Node;
	bh=QQNCTKmmchfJEJACQOo9jhYz+zJJqu984CeLN+Bt7jM=;
	b=b2GOE6IF0ZmBhOZYgiV5c0RAX3TJjBYQiAvdr2Skuf+MyTngRzVRxMfzhgEvMwCQZ4lH
	 ZTr3/Qd+gLlKoIF50GYgQWoRPSF0YwKQL4dXS3IjMf7ZODwLRCtOknV3H5ejR8QIZo2gW
	 G+IiP1JW/aZV3TO9QOYVAT1EY9KjpcNlraCy3kpfFPHzdjtZ1+Ui2f1eeGxOUiGCGUy3S
	 WROM7WHO3EKomzdiAvdFTkHlFI0foNlFcxhx6iecMf7wjYYXFf67ZMm9imtNNvnnTWuPK
	 ErtyFx0iO8+lLuBBMZm2WXzbxOzR6lXKG7BvUaWSSviP60b6SO4MCWuCpHdZ6dqPxrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cisco.com;
	spf=pass smtp.mailfrom=cisco.com;
	dkim=pass header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport01 header.b=V9O831+h;
	arc=none smtp.remote-ip=173.37.86.78
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD49606A31E;
	Thu, 26 Nov 2026 05:12:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AD49606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cisco.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport01 header.b=V9O831+h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=968; q=dns/txt;
  s=iport01; t=1795669933; x=1796879533;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QQNCTKmmchfJEJACQOo9jhYz+zJJqu984CeLN+Bt7jM=;
  b=V9O831+h+/OYNnWs9+kl+AZemrrh0GworkfEqoUuqO0bM7KGd07AASQj
   ujsWFxLYraxJct1Dx65KNMAkvxJ2qNOlaBEXZjRBunio6JN1gjDrz+UgZ
   bLb7pMxjwrddnJoHEOfGmH3Ij/5F2xUMhdbys3tRFdCWctelg7RD7E/1r
   44zC9AXGxVe/QvizAEuoo7HUB9RVzHsAJqS8v8w6GAZpdV1i/yj3V1mhB
   6OUOM33SK83xltsRBQDj/HKxzklpAdcFAVs6zbYLDpx6oaZ0PHd6k2MXF
   qNkzG7a5wrxDc+7GEIf4WNQ88C6j2uI9L71N42kHGrQxWIY3hOfL67T98
   w==;
X-CSE-ConnectionGUID: B8MUvQ+fRMO8rvRpDsuRaQ==
X-CSE-MsgGUID: 7BVbrirOQMCwikZAM0WwVw==
X-IPAS-Result: =?us-ascii?q?A0A+AAC6vgdr/43/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?QYBAQsBhCtDlxSeLBSBag8BAQEPUQQBAYUFAo4jAiY1CA4BAgQDAgMBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZckBMCAQMyAUYQC0ZWBgGDFIJ1A7g8g?=
 =?us-ascii?q?iyBAd5JgXQVgTgBhXOHc3YbhGMnG4FJRIQJBzE+axoBgxkLhl8Egg0VgQyCV?=
 =?us-ascii?q?oIglBhICoEUA1ksAVUTDQoLBwWBJRAzAyAKCxISGBUCFA0QEg8EFgUtHXAMJ?=
 =?us-ascii?q?xIpFxF2GwYFEiAqQEMwK4ESgQNdgSsoXQECH0YtFYF1AoJRgSNdAgFJQQ4HR?=
 =?us-ascii?q?VMJJUMSRyQiCBIJARMaLAqBGjU8CSY/FQxbDAgDGgUaJgIfCAILAgx0KBEQE?=
 =?us-ascii?q?x0cJC8FGSY8GwqBDCcdHhkOAikGFiELQxgNSBEsFCMGDxkEPm4HlwM9fViCG?=
 =?us-ascii?q?SOTP5IEgTWfXIQrgWifdhozqnOZCCOjaVCEaoFpATqBWTMaCBsVO4JoUhkPj?=
 =?us-ascii?q?jmTKAG/HSZwAQcCBw8CgXOQEYFtAQE?=
IronPort-Data: A9a23:FIk4y67cGmjthqhKfw8j7gxRtOrGchMFZxGqfqrLsTDasY5as4F+v
 jQcC2CFb/2JNDTyKYxzPo/i8UIGuJKDxtZjTgA4r3gyZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOi78BGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqaztOtfrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eF909x/hOQm900
 NtIMi43djyYmti/+efuIgVsrpxLwMjDJogTvDRkiDreF/tjGcyFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEWUrsUIMpWcOOAnXDjciZYq1K9rqss6G+Vxwt0uFToGIeIIoXTHpkPwi50o
 EqZ1VrzGBAAE+W64iWE8UCFo7fwgh3kDdd6+LqQs6QCbEeo7mAaFhATfVeyv/S8jkmwR5RZJ
 lB80icisK075kG3ZtrwRRu1pDiDpBF0c9pXCeghwAKA0KzZ50CeHGdsZj1cYtUOt8IsQzEuk
 FiTkLvBDDpjqrCKCnSQ6ruZsxu2JC4Ta2QCDQccRAEI5djLuow/jhvTCN1kFcaditzzBCG1w
 D2QqiU6r6scgNRN1Kih+13DxTW2qfDhSAMp6gjJdnyq4xk/Z4O/YYGsr1/B4p59wJ2xVFKNu
 j0A3sOZ9u1LVc3Lny2WS+JLF7asjxqYDADhbZdUN8FJ31yQF7SLJOi8PBkWyJ9VD/s5
IronPort-HdrOrdr: A9a23:TICFr6yQTPtlx8XnyKjkKrPwDL1zdoMgy1knxilNoNJuHvBw8P
 re+MjzuiWbtN98YhsdcJW7Scq9qBDnhPtICOsqXItKNTOO0ACVxcNZnOnfKlbbdBEWmNQx6U
 4ZSchDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: 9a23:/QZPt2GfUiW8b4CwqmJNpGspBPlmfEf46yfKPXWgJX10crSsHAo=
X-Talos-MUID: 9a23:15qpTwTkGahdOzX7RXSzrg9oLsZyxJ2LI18MkqcvnpG7KhJvbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,234,1787011200"; 
   d="scan'208";a="550113424"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Nov 2026 05:12:12 +0000
Received: from satishkh-l-mj0bbv6x.cisco.com (unknown [10.25.129.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 6B58E180001BA;
	Thu, 26 Nov 2026 05:12:10 +0000 (GMT)
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
Subject: Re: [PATCH net-next v3 3/6] enic: recover V2 VF mailbox after request failure
Date: Wed, 25 Nov 2026 21:12:07 -0800
Message-ID: <20261126051209.3558558-1-satishkh@cisco.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179539392669.3135.1675208321907591748@kernel.org>
References: <20261118-b4-enic-sriov-v2-vf-receive-control-v3-0-2cb25677aa8c@cisco.com> <20261118-b4-enic-sriov-v2-vf-receive-control-v3-3-2cb25677aa8c@cisco.com> <179539392669.3135.1675208321907591748@kernel.org>
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

CMD_SOFT_RESET is in the V2 VF allowed-devcmd list (enic_vf_v2_allowed_devcmds[])
and the firmware scopes it to the VF's own LIF, so on the PF this series targets
it is authorized and VF-local: a reset through enic_reset() takes the soft-reset
path and recovers the VF (verified on hardware).

Soft reset is deliberately preferred over hang reset in this path - it is
LIF-local and DMA-safe (the datapath is stopped by __enic_stop() before the
reset), whereas CMD_HANG_RESET has cross-VF blast radius. A soft reset rejected
with ERR_EBADSTATE is already contained directly rather than treated as fatal,
and a genuine reset failure uses the common detach path shared by all enic
functions.

The series does not target soft-reset-denying PFs; the comment and commit-message
wording that implied an async-PF interop claim has been reworded in v4 to state
only the technical reason the V2 VF recovery path issues CMD_HANG_RESET directly.

Thanks,
Satish
