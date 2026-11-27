Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.61
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792124;
	b=iAzWyBj+8NVDMyeimj22ZaXxcqBUnEATtiN2fV2nezEpjED8rTDR8fiLnrliY4kiJI/t
	 hparDIAykJx5/wph4CLlBcEKVWBkSz8nzitoiBUtq9gthJH6/0WDT3srU3Et1WzeFvn0P
	 ijcXtlNVPp7lAr7NoVmJKEZ35HpvkRBLexItkPrqxWR21xQ3QAVPBc9wBOxxO8iRAu9TA
	 +1iwbG4T7maxFXFIeiqqqm2CyaU0WItuW0bR19cCGNrvi0dk2UzxrGRYgWBpoXoFGjwCP
	 aAaFj8fnoWVU/bEpzen6j+175apo5fMMibqUXoijapcTct0ypXVqJHQAy7ufFUXxkCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792124;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=muNvK9LefSzPBuodcVVUfzwx3zouBwL9SxDxhw0Uttc=;
	b=sADooM4EXgyrxPMD0fIc1BIYnFeJt4DBZPdCpNxX4x2w7Pqy15Ui0rTvmwRhxPL6zvB4
	 u33LZMHh4IdU4ksSN2/PQasxF5FzDpPuLMNaTr0JRebOhN4yPhi9DyIPXCOmjsSbXhFuq
	 vTt04isDD77Ddnau7KtjSxrKRpqAOILEdO3VONsFWPFm6Ce4hwaIdhENPR8wJGS7uAFxg
	 tA9WolkW4BJLwcCy4G28cvKvSnx+N21JHby5CrbSPdTWr21redqgvzlN02lRJS/jA5Cuw
	 t0IgwHxm5K//Ya3iP+7ZZFS8U6pwlDlrhcUizflLY4aFfwc7G3HX3MGad8xwPeFM1eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=0oCvcGp4;
	arc=none smtp.remote-ip=195.10.208.61
Received: from mout-b-201.mailbox.org (mout-b-201.mailbox.org [195.10.208.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F904606A31F
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 15:08:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F904606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=0oCvcGp4
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-201.mailbox.org (Postfix) with ESMTPS id 4jbcHp4NGKzLlRq;
	Fri, 27 Nov 2026 16:08:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795792118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=muNvK9LefSzPBuodcVVUfzwx3zouBwL9SxDxhw0Uttc=;
	b=0oCvcGp4Sqo5fXGF32FgtsVu7ANklyn23c+82c9UFjRol6fmA7pxR4/pGwV1xUx3DLtSRO
	lKj46LyVXxqCjD+d7nt3rNS9ralyZKy4CJAUhxunC/c1XPbtmosZJtndD9KIz/MG8gLVVx
	z+lh2/sy1+1GVrjTbaG9QOho9cl71Viloos0m+jAiDxp3nnCayLubiJrFEuDyLTYmwPZG6
	ADLNwwSlvJ3RG9Sc6ytbXM720PmilwIh59b2RbTU0NPtUmOhkgd62sa+VEo7nMt5DqmByp
	0AZ+ngiqbr72P2eHxf8a7N4nxh7wgPdhkhezjH2hLSsCcMLc55OfzBkHFCODPw==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of antonio@mandelbit.com designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=antonio@mandelbit.com
From: Antonio Quartulli <antonio@mandelbit.com>
To: netdev@vger.kernel.org
Cc: Subash Abhinov Kasiviswanathan <subash.a.kasiviswanathan@oss.qualcomm.com>,
	Sean Tranchetti <sean.tranchetti@oss.qualcomm.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Daniele Palmas <dnlplm@gmail.com>,
	Koen Vandeputte <koen.vandeputte@citymesh.com>,
	=?UTF-8?q?J=C3=A9r=C3=A9my=20Jean?= <Jeremy.Jean@oss.cyber.gouv.fr>,
	Antonio Quartulli <antonio@mandelbit.com>
Subject: [PATCH net-next v2 3/3] net: qualcomm: rmnet: fix TX aggregation timeout overflow on 32-bit
Date: Fri, 27 Nov 2026 16:08:27 +0100
Message-ID: <20261127150827.785753-4-antonio@mandelbit.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127150827.785753-1-antonio@mandelbit.com>
References: <20261127150827.785753-1-antonio@mandelbit.com>
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
X-Rspamd-Queue-Id: 4jbcHp4NGKzLlRq

On 32-bit, time * NSEC_PER_USEC is computed in 32 bits before being
stored in the u64 time_nsec, so a tx-aggr-time-usecs above 4294967
wraps: 5000000 is stored as 705032704 ns and read back as 705032.

Reproducer:

  ethtool -C rmnet0 tx-aggr-max-frames 64 tx-aggr-time-usecs 5000000
  ethtool -c rmnet0

Do the multiplication in 64 bits.

Fixes: 64b5d1f8f2d1 ("net: qualcomm: rmnet: add tx packets aggregation")
Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>
---
 drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
index 033699aa0385..46dcfba86b3f 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
@@ -686,7 +686,7 @@ void rmnet_map_update_ul_agg_config(struct rmnet_port *port, u32 size,
 	spin_lock_bh(&port->agg_lock);
 	port->egress_agg_params.bytes = size;
 	WRITE_ONCE(port->egress_agg_params.count, count);
-	port->egress_agg_params.time_nsec = time * NSEC_PER_USEC;
+	port->egress_agg_params.time_nsec = (u64)time * NSEC_PER_USEC;
 	spin_unlock_bh(&port->agg_lock);
 }
 
-- 
2.56.1

