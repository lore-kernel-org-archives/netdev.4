Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=173.37.86.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795669940;
	b=zemnbDZ1cyJTJTRkHT2xOt1gERYgppmAeP3PHZEt9tzpXj57aHTx4qXJufUklH56BLUN
	 WM4mwlMCVI5vndWQu1GBidXMvwQLR99qeKjN9tdsXFdGxU4owzAOU86zJSN/2iukPtF67
	 GL+knUCA66oINYbAys8Z5v14kKhrXRGgSC9jBjVpp/R9MJpsFmNS5Cq6uYwKfofOSvBDp
	 bIRfqzcdKdpgPf4PCPeChSAbPFtWC3uh+Gutl4p/MnBFZkC1JwDIk69dTKLziY0ZfAWsh
	 5xeGQxwgHYovR6EEJRQCOp3mvvO/6vmEdRpriomNvqZZsXMFQFpKQl9WdY7x1uwbZxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669940;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IPAS-Result:IronPort-Data:IronPort-HdrOrdr:X-Talos-CUID:
	 X-Talos-MUID:X-IronPort-Anti-Spam-Filtered:X-IronPort-AV:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Outbound-Client-TLS:X-Outbound-SMTP-Client:X-Outbound-Node;
	bh=l0+4vYUvzx+7fVg8jTLBW0LVDCNqP9lvA6aBUYGwEXQ=;
	b=BNrwa3h6T0FQUuA8wd3j4g6bUeKYUtQMyTgT1RZLGAZZ4mVQkwKK/jLQT2TVlDMaLPZO
	 GTEmeFHopjFBpY1UF3ruClpW8cj/50x97Zm4yZNbULeIY7czZlPlDd0/b6Gg8wAMBC5mb
	 +aRJ7UlrYu++hj9g9LuI1tN5PdpnnTmKcXi8csJLaJQ8S/Gds7hQIQORY9ppQQGd6olfn
	 u2w6AVQDejF3dEXv+6GYXsCCShzcIfFD/qth4jxJYnkKDAYTGTNnNaYdnPkpFV27HzuRF
	 gy8QtzrUHuTqwrojaJ9KYQMmtmHKCq7XmkAIY1A1YvTM+fxUl1yQ/bfW5zsZVCzixnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cisco.com;
	spf=pass smtp.mailfrom=cisco.com;
	dkim=pass header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport01 header.b=RPxDmrcB;
	arc=none smtp.remote-ip=173.37.86.73
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD772606A31C;
	Thu, 26 Nov 2026 05:12:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD772606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cisco.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport01 header.b=RPxDmrcB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=450; q=dns/txt;
  s=iport01; t=1795669939; x=1796879539;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l0+4vYUvzx+7fVg8jTLBW0LVDCNqP9lvA6aBUYGwEXQ=;
  b=RPxDmrcBe75nzlrKc3NB677aAIdaMCL2v7XLBoxMI0lT+XM9josWz5b+
   TlpCBsXI6nuWrV3UDJa1yweLCts1Q/cFxw1JZ8189VBLSED0RauDJ8xBK
   khi51+o3OoQPZ0o8o11C5JZoA5TlXEcWbVKoF62CmpBtLgId6vBJ324lB
   FmfCoIHjiM/rYWwrltR+aKy3IlR84kVOfnbRnlWJtK+2PLi87tiXJ0uI8
   cuSwv9zUcQKpOmc0NsjMQmnUpFiXr7YcDQYkVwHlOzY8dV05cLlf2V5Js
   udpn0a5RoAvk7vEJKz4ETk6GK4Z/olFA7OrWb5ei0zglDTVBdsTWTm8in
   w==;
X-CSE-ConnectionGUID: 6e6mbLW0S/mP2YnqrHGfsw==
X-CSE-MsgGUID: hwiMfqovTnmzSb1aJJhNsQ==
X-IPAS-Result: =?us-ascii?q?A0BaAwA8vgdr/43/Ja1aHgEBCxIMggULhCxDlxSeLIF+D?=
 =?us-ascii?q?wEBAQ9RBAEBhQUCjiMCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4ThlyQEwIBAzIBRhALRlYGAYMUgnUDuDuCLIEB3kmBdBWBOIV0h3N2G?=
 =?us-ascii?q?4RjJxuBSUSEEDE+gRmJcASCIoEMglaWOEgKgRQDWSwBVRMNCgsHBYElEDMDI?=
 =?us-ascii?q?AoLEhIYFQIUDRASDwQWBS0dcAwnEikXEXYbBgUSICpAQzArgRKBA12BKyhdA?=
 =?us-ascii?q?QIfRi0VgXUCglGBI10CAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VD?=
 =?us-ascii?q?FsMCAMaBRomAh8IAgsCDHQoERATHRwkLwUZJjwbCoEMJx0eGQ4CKQYWIQtDG?=
 =?us-ascii?q?A1IESw3Bg8ZBD5uB5ZHAWMNDxGBeyOnHqERhCuBaJ92GjODcacCmQgjpDmEa?=
 =?us-ascii?q?oFoPIFZMxoIGxU7gmhSGQ+hYQG/HSZwAQcCBw8CgXORfgEB?=
IronPort-Data: A9a23:cRrzS65FycbtmjaA0X0qGQxRtOrGchMFZxGqfqrLsTDasY5as4F+v
 jBLUWnUOK7bYzSne9pyO9vl90wGvsOAyoc3TQBo+ygzZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOi78BGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqaztOtfrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eY4BG/+xTPjl1s
 vkgcgELdwqjqOyt3+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGcyFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEWUrsUIMpWcOOAnXDjciZYq1K9rqss6G+Vxwt0uFToGIeOJIHRGZwNxi50o
 ErG4GXcDAgdKuCZzCi++CulpM3PuzjCDdd6+LqQs6QCbEeo7mAaFhATfVeyv/S8jkmwR5RZJ
 lB80icisK075kG3ZtrwRRu1pDiDpBF0c9pXCeghwAKA0KzZ50CeHGdsZj1cYtUOt8IsQzEuk
 FiTkLvBDDpjqrCKCnSQ6ruZsxu2JC4Ta2QCDQccRAEI5djLuow/jhvTCN1kFcaditzzBCG1w
 D2QqiU6r6scgNRN1Kih+13DxTW2qfDhSAMp6gjJdnyq4xk/Z4O/YYGsr1/B4p59wJ2xVFKNu
 j0A3sOZ9u1LVc3Lny2WS+JLF7asjxqYDADhbZdUN8FJ31yQF7SLJOi8PBkWyJ9VD/s5
IronPort-HdrOrdr: A9a23:N2cAQq6bez2Kz4AofwPXwOjXdLJyesId70hD6qm+c3Bom6uj5q
 STdZsguyMc5Ax6ZJhko6HiBEDiewK4yXcW2+gs1N6ZNWGMhILrFvAB0WKI+VLd8kPFm9K1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: 9a23:bZCzJmFVaXW5a1L+qmI5+RAREOQaKkaayU+KEkmhE0ZGRqaKHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AshPVvw7eOYJUD8znqjI1zp08xoxo/KWLBlkKj6k?=
 =?us-ascii?q?Avtu/P3V5GRWdqi+OF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,234,1787011200"; 
   d="scan'208";a="536534100"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Nov 2026 05:12:13 +0000
Received: from satishkh-l-mj0bbv6x.cisco.com (unknown [10.25.129.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 852B4180015C1;
	Thu, 26 Nov 2026 05:12:12 +0000 (GMT)
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
Subject: Re: [PATCH net-next v3 5/6] enic: manage V2 VF station and administrative MAC
Date: Wed, 25 Nov 2026 21:12:08 -0800
Message-ID: <20261126051209.3558558-2-satishkh@cisco.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179539393028.3135.14682126531016324837@kernel.org>
References: <20261118-b4-enic-sriov-v2-vf-receive-control-v3-0-2cb25677aa8c@cisco.com> <20261118-b4-enic-sriov-v2-vf-receive-control-v3-5-2cb25677aa8c@cisco.com> <179539393028.3135.14682126531016324837@kernel.org>
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

Thanks - I confirmed this on hardware and it behaves as intended. The PF keeps a
single station entry for the VF: an administrative-MAC change, and the VF close
path, replace the station address in place rather than adding a second one.
Dumping the VF's card-side filter list on both the admin-MAC-notify and set-MAC
paths shows one station entry, not an accumulation, so a closed VF leaves no
untracked station MACs behind.

Thanks,
Satish
