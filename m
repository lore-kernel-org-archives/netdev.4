Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795570732;
	b=l1GdGd7ij3a36PZCFTWak1C88UnqyKPOfKBF/t0xQxOij90Zbz0NmVRfyZ7P7O4XJU7U
	 u7TfQeMsPJBSHHpK1A0PKgL4becx3/jE64WI/U+pvOfu7v3msbKHtbJGz6N1LT3tVeyOa
	 PCZ7xPffJTU3+TVGTYZckazGX8LyvoBwYzTbzT1gWfn2hG7C507uq0CqBwKq/vudL3uCB
	 UHblFXnG0wsgzScvmiwFGW763xFDlUhTxklspwcUAwXQSE8r4TKmw4jbrsgATR6/7T4GI
	 KcjcDzBFkz+jL3d1dRkfNJGdlCaToS7fpwDeqxVc5e46pf8QGUfiGfFewRtb67UIBiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=psYMV3ATiJmswPO3YapZnD4ib64/nAD9OzDIxn9t9vg=;
	b=23ksHucEydAYQxgoZQoB661GNsPR1DL3MbPeIYTU5sSKbMD2OhIB5XvvYBbWUO/19e+8
	 0sBsOUweyS8PC1tsdp85++HRCfZzdl39ZyjZnmt+RfLvE3Exqc13rIfufdMjkGMJW31Wg
	 0SaLhGBwpB1yclbRRlwyupTjlGjdD8u8zZrST+MmfA0U34jlhoflmpko8WYV6KL9EFbLh
	 c1WXmJOq9bdW17r8fbCChDEE7mWlo+D+FT5GGSTi+FT6PYo2ebmkC8yv84OWaiRyocOgu
	 tBJolM4FbANN9pC8M5L7u5ZDK8TD066O2gdFlZFOmFBTO9LdNCxaCcoOfT5Beuc+8/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=RNrhwEoD;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB27606A326
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 01:38:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EB27606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=RNrhwEoD
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b413d04c93so3020046a91.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795570731; x=1796175531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=psYMV3ATiJmswPO3YapZnD4ib64/nAD9OzDIxn9t9vg=;
        b=RNrhwEoD1WQ5n0+frjYfB0/+GkDgPyndYCWL7uaPT+rc+yd1ieebM04HIsjbGE8yvI
         LwFYU7MiiCGgyAvqYJZj1d07rcrUfbxdVV0YOCGN6Z2t71mS4cAsDTLxrzIMpkSLAPtx
         ZkQrv+sASlgpuH3CB5Ohc3oR8AY7giH0Ulro63myIsTk0ma4TJZY0X1uNx5AXAVzDVTb
         X9VA6kAGdhxr/pj/6Pbj86JOeWNKDG2DfCN2gZQtfv1ytTBCGubehvemHBqSiPWqIQQh
         H7bIjFbBTxSu5uMisOhL+6TsxEQvsMnmybcsgHR1rEGdrGWyt9tQ9guhjquYLh4gZZis
         CfxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795570731; x=1796175531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=psYMV3ATiJmswPO3YapZnD4ib64/nAD9OzDIxn9t9vg=;
        b=Tg0UcYYcL2o7PnpZNx8Mst71OYJWQzSXarGALojSA766pRcJ5Buo9EIMjAJRLIx6y6
         pppPtKu1w/IliDk6dPaBuBquhRkFVxKvKb1Vg8D12t4FpX32v4WiEh7ZO47v/y5wPm6A
         afIBPahQ4Fi3mOIKGfX3H0dlltmwFDPDjC5PnEbHaR+Ty3ry1swcMzDHaZP+qfiEh+ch
         eJnuBY1LFp1c3fwpJvJDfK6ho3FECuEudueczrA6CZcKulTKUhXHyeULHU0ryY8WXVSM
         wYPBYZ4+MISmeSG62h4PrMZZgrlLlZdpnbo56m8j+lDTSEJsZLUAa6rtFE5qbWFnseDc
         CMXA==
X-Gm-Message-State: APuU4Z9zEFF5KBbAHVglE+bQOKXquc6j5Ohw6Ty12DSaKMzz/p2cJs14
	WcZyxhGNNT+kXD6xZHpzvHQufpWWV3oxi0pw07zs2dcvBRCboZ4NgY4nvbR79eblJoyLRupg+DX
	mY3cg
X-Gm-Gg: AZFdTZdq+w6x3eiWu/mDFPiv2BL2qmFsjZwsH00BoQRMmNcFcjLa8Q7IxSRtVXieROh
	5jPnFZL4K6rT2eNKPifbYrdzJ1STcV/zzDmv3mhyS9J3scOQtwrr37ODED3Jp4Emj8d7m2nvJ+Y
	81s8v261XKtBlDBEr2oT9bLACzFxAlW6bL2KnT2IBQNWpYMO10T0nHh4TB6xML+SbQa7PcbwaHR
	2IYDDb2BIxMC4vO/2dVFjNoBICQTDjlI7EwDIJ4EocByHX7GhT5grZ6kc76tRUuypZqLn6FomAB
	Y7Mf5qyKxrnVKTUDjIJmO7R7mFklc+tCr4Yb4Todno/K3kpqzRilxcu1WdPdcxxfTZKoaqShDLn
	7QsHhugfKM4hrYzLiPKQ/s7cUMyMWzNH9zsvU/LMPrrcAYwN/cpVtkGQk4kZO2Orf+9kvefoxIf
	FUui2TWUlHevOB4witGmJP+tvyTCyuXkYvljG9QUbVyCABzrZvXe6b6tAlVjnwh5tjF4JDIX462
	lPAImuhEsL3U6xFJqc3JjMNmcG3LYdioOhW7jQ2Z5amnBIVF8pEIcUuuI4asIMD5AdD1EdbTy2j
	kHWa8oz0Tp9TgYkYqQzEWg4H7wTIIMPD1Id+HQxGa8U=
X-Received: by 2002:a17:90b:4c8b:b0:3b3:c930:35d1 with SMTP id 98e67ed59e1d1-3b41cb20e72mr17587652a91.51.1795570730703;
        Tue, 24 Nov 2026 17:38:50 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:4b::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad48786sm25108088a91.9.2026.11.24.17.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 17:38:50 -0800 (PST)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	narcisav.kernel@gmail.com,
	Joe Damato <joe@dama.to>,
	Eric Dumazet <edumazet@kernel.org>,
	linux-kselftest@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>
Subject: [PATCH net-next 0/2] selftests: drv-net: uso: test small MSS
Date: Tue, 24 Nov 2026 17:38:34 -0800
Message-ID: <20261125013838.3823834-1-joe@dama.to>
X-Mailer: git-send-email 2.53.1
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

Greetings:

Jakub, Narcisa, and Sashiko previously discussed [1] how small MSS might
produce unsegmented skbs on bnxt; Jakub suggested that USO might trigger
this condition.

This series extends uso.py to test small MSS sizes. I ran the updated
uso.py on a bnxt thor1 device (with SW USO) and the test passed, as
expected.

I have not yet run this test on a HW USO bnxt device because I do not
currently have access to one, but I think extending this test to cover
small MSS is a good idea regardless of whether a particular driver has a
bug.

Thanks,
Joe

[1]: https://lore.kernel.org/all/20261120154835.0f56c410@kernel.org/

Joe Damato (2):
  selftests: drv-net: uso: check datagram sizes at the receiver
  selftests: drv-net: uso: add small MSS variants

 tools/testing/selftests/drivers/net/hw/uso.py | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)


base-commit: bc686737f555b9d406d2fa80fdc69c85be6eca8f
-- 
2.53.1-Meta

