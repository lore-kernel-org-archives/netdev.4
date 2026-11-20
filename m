Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.250.60.165
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171757;
	b=trZDn2cpFT0djG8tMsFGShudp4tWDQ5sQMPK7ZGt5rXtOfuoEI7Y5kb8ZpZ84kDk+IKX
	 OvkI3G0GCE6iKx+WTGOHwHr3Jk13cR/sdsb6FKfqCqY4XZ5Otl7MPFM/2N8AfEJGIN2xQ
	 P7+6yns827nlchSZofXQacd/1SV4LQ7ymrsTlYUK8nBj5ysLqx1UCfyCMkYDhPGqowWXX
	 Ek0N3++gPFlHn/R5Fl8Sl+pnDQb/I/LM/TslnbIbvtLnPQdcm96WfncHjNgUFGUwP2Yel
	 bzn8GrJUj/iOTW5rQSygrx8jz4vHOtyTz2qYdUC4FV2p8fuVaGrZ/f4E+W20+woGnOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171757;
	h=DMARC-Filter:Received:Received:X-Yandex-Fwd:DKIM-Signature:From:To:
	 Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iIVSA25moi7DnPZAUtOBii30CIkld3pdwPKkpGu8brw=;
	b=3akC6I6SbfQ3nUZJCJoWiSgbQyM0rdZ0uBETf9JoQMgEPHgk/KLdKVehkXT5FcqgCB4P
	 VzzrLRg3WrRuT/ugY6dw9FUiONUzGyENtRKvbsKK4ZIMEcQHNfTHHHaWBgZg5MUykwW0m
	 1WG2Kq9a6SuPlDz42QYkuouXQZT5RSLlVU6fEptYkbUEi5BgmMgDpebIJoedahLyx2iHX
	 GZlJY4cBMIokz7/cByE/xr8Q/bg93fVzpEvL6dSguYpcv60qZTEFaBpxcKP2yQmfJenz9
	 udAzgruCIEQqcsD4Y0kad10v+v4F4mzHDHJyLYY9sedbMXXlBPG6+KhIcCXCbVhMEDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yandex.ru;
	spf=pass smtp.mailfrom=yandex.ru;
	dkim=pass header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b=ZkeQhw8K;
	arc=none smtp.remote-ip=51.250.60.165
Received: from forward105d.mail.yandex.net (forward105d.mail.yandex.net [51.250.60.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B59606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 10:49:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8B59606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b=ZkeQhw8K
Received: from mail-nwsmtp-smtp-production-main-57 (mail-nwsmtp-smtp-production-main-57.yp-c.yandex.net)
	by forward105d.mail.yandex.net (postfix) with ESMTPS id 5EBF5100058;
	Fri, 20 Nov 2026 13:49:11 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-57 with ESMTPSA id 8nZfxaKnE8c0-LEEZR3Od;
	Fri, 20 Nov 2026 13:49:10 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1795171750; bh=iIVSA25moi7DnPZAUtOBii30CIkld3pdwPKkpGu8brw=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=ZkeQhw8KfW93bncm4L7DWE+ymEmzX1ZBo1rwwa63H8B6xlmH9+IDxBoMS7DoCIb0U
	 juH5oXNb6/cLDyAXUd4D3g8Ow8MNwEuFzpf9iVjJhM87xNyuJjvOhOp3qQZr8od6n4
	 ZSguAHqTpsHgQ6ZGzV8GzyDlUSi/gokUEUrmjzyg=
Authentication-Results: mail-nwsmtp-smtp-production-main-57; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Potnuri Bharat Teja <bharat@chelsio.com>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] cxgb4: use kstrtou16_from_user() in tp_la_write()
Date: Fri, 20 Nov 2026 13:49:07 +0300
Message-ID: <20261120104907.831328-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.56.1
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

Simplify tp_la_write() by using kstrtou16_from_user().

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c
index f521737d1275..ae9ab0d51e27 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c
@@ -664,20 +664,13 @@ static ssize_t tp_la_write(struct file *file, const char __user *buf,
 			   size_t count, loff_t *pos)
 {
 	int err;
-	char s[32];
-	unsigned long val;
-	size_t size = min(sizeof(s) - 1, count);
+	u16 val;
 	struct adapter *adap = file_inode(file)->i_private;
 
-	if (copy_from_user(s, buf, size))
-		return -EFAULT;
-	s[size] = '\0';
-	err = kstrtoul(s, 0, &val);
+	err = kstrtou16_from_user(buf, count, 0, &val);
 	if (err)
 		return err;
-	if (val > 0xffff)
-		return -EINVAL;
-	adap->params.tp.la_mask = val << 16;
+	adap->params.tp.la_mask = (u32)val << 16;
 	t4_set_reg_field(adap, TP_DBG_LA_CONFIG_A, 0xffff0000U,
 			 adap->params.tp.la_mask);
 	return count;
-- 
2.56.1

