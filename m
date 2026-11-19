Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795072995;
	b=eQSFrs/iVOpEdvy4UCp2FErJ9GmHWvSWiD/xT+/AD+teeYpYzJzCfemMwR5ye7Zwasmp
	 G63Er8Uwv+2kzYSx2tmlz4iFcgptcdr/GjMTV1V7HKvPTJTkmmbH5Uh6WE+K7Yux2oOoN
	 00wVlCrzCGwhsJlerRS7/0OiZkqdPEkbbUzLrTp+wwJ1mNxRxxzo8/87WIyEw+qb5/yoa
	 Id8zeU/NGZQTGRDxokyoD/ZcN18exS3WoD+coM2xz0OUn8LcDFXYfuAO/bXry8/Rgd6vy
	 fCU66VPlqv363jadqqfZJjznyP145/sloO+b0x44mRv7pFUPsoo1VXrvwXJrOhzAGdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072995;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=vSn9bNRrwBiwGWggjC0FgELlI2uG6856pRwtJqmyDa4=;
	b=CnWNN3ewei5qms0PbPwrXhhCHD7q9JhGsmUQznIpRwojkZVxQuuIBbjtao86g2B5Crwo
	 1IyF1CY1neseODtmaRBmp/FFIUa3TUjUTv7Wsb3z4EgR2f+m4OoQUBHwUifO7yqHk5CmG
	 prSrfuGyebtfaYPwIK+eO4Hu+dwUWr+qDSr0KGDUDDOzVpRam8wu5oxPbNgrBLb8bdXSH
	 QaXAq7FNRwAF1DyMmZ5Hh6QWv5/VReZV1K34GJYkFzuZHPj+g6mb0R33AbOz0f5/j8Z7B
	 Puih7YFLXFPqm96qDwcuKp2Krw0l/4ozl3b653w5NyAbozxj6/kapiOLXoaWvg6ghSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Dd2lf/aV";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91364606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 07:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dd2lf/aV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E9AB1F000C8;
	Thu, 19 Nov 2026 07:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795072995;
	bh=vSn9bNRrwBiwGWggjC0FgELlI2uG6856pRwtJqmyDa4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Dd2lf/aVHsq8VIXpxg2GIyDwp+M/ipzF/5rtbciUnNkETlQUkkWmXuua03UE4S5tS
	 2owR3ikJrCZ9FuCDdFdd5zfpjjR2c85VSHTd3dk8BXX4DzZMIKKVIcCMCpfWJk6KzL
	 v3lLIu6p1z4A9p1qLeA9CsIBugt13ZhJ2hM06PFUt9bxrHha8ENqkYCqFgcZFqJMP0
	 qoJK8NJ4cwX/JSgXfQZRFw2TZFplQTRx40DlaTU2H93W/QM+9CkMvARTdGUPYvEkfV
	 mt2cxNl2dp/MULmPJhppw4dCfS8upw38HPwvbgQGKiNmSEQZ0V+ubCvxHMGScQ3MmH
	 NnpKWlG7OaCWQ==
From: Eric Dumazet <edumazet@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	Eric Dumazet <edumazet@kernel.org>
Subject: [PATCH net-next 4/4] tap: remove tap_get_tap_dev() and tap_put_tap_dev()
Date: Thu, 19 Nov 2026 08:22:58 +0100
Message-ID: <20261119072258.3157902-5-edumazet@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119072258.3157902-1-edumazet@kernel.org>
References: <20261119072258.3157902-1-edumazet@kernel.org>
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

tap_get_tap_dev() takes a reference on tap->dev, released by
tap_put_tap_dev().

This comes from commit 8f475a318aaa ("macvtap: introduce
macvtap_get_vlan()"), when q->vlan was read under rcu_read_lock_bh()
and the reference was needed to use the device after
rcu_read_unlock_bh().

Both remaining callers, SIOCGIFHWADDR and SIOCSIFHWADDR, hold RTNL
for the whole time the device is used. tap_del_queues() clears q->tap
under RTNL, before the device can be freed, so a non NULL q->tap
guarantees the device stays around until rtnl_unlock(). TUNSETOFFLOAD
already relies on this.

Use rtnl_dereference(q->tap) directly.

Signed-off-by: Eric Dumazet <edumazet@kernel.org>
---
 drivers/net/tap.c | 23 ++---------------------
 1 file changed, 2 insertions(+), 21 deletions(-)

diff --git a/drivers/net/tap.c b/drivers/net/tap.c
index a240609d2a8a6b643216135d4b80540c18cf11db..2d6af83d97b38e5dd9137c02e5bf002a1d12f678 100644
--- a/drivers/net/tap.c
+++ b/drivers/net/tap.c
@@ -866,23 +866,6 @@ static ssize_t tap_read_iter(struct kiocb *iocb, struct iov_iter *to)
 	return ret;
 }
 
-static struct tap_dev *tap_get_tap_dev(struct tap_queue *q)
-{
-	struct tap_dev *tap;
-
-	ASSERT_RTNL();
-	tap = rtnl_dereference(q->tap);
-	if (tap)
-		dev_hold(tap->dev);
-
-	return tap;
-}
-
-static void tap_put_tap_dev(struct tap_dev *tap)
-{
-	dev_put(tap->dev);
-}
-
 static int tap_ioctl_set_queue(struct file *file, unsigned int flags)
 {
 	struct tap_queue *q = file->private_data;
@@ -1040,7 +1023,7 @@ static long tap_ioctl(struct file *file, unsigned int cmd,
 
 	case SIOCGIFHWADDR:
 		rtnl_lock();
-		tap = tap_get_tap_dev(q);
+		tap = rtnl_dereference(q->tap);
 		if (!tap) {
 			rtnl_unlock();
 			return -ENOLINK;
@@ -1051,7 +1034,6 @@ static long tap_ioctl(struct file *file, unsigned int cmd,
 		if (copy_to_user(&ifr->ifr_name, tap->dev->name, IFNAMSIZ) ||
 		    copy_to_user(&ifr->ifr_hwaddr, &ss, sizeof(ifr->ifr_hwaddr)))
 			ret = -EFAULT;
-		tap_put_tap_dev(tap);
 		rtnl_unlock();
 		return ret;
 
@@ -1059,7 +1041,7 @@ static long tap_ioctl(struct file *file, unsigned int cmd,
 		if (copy_from_user(&ss, &ifr->ifr_hwaddr, sizeof(ifr->ifr_hwaddr)))
 			return -EFAULT;
 		rtnl_lock();
-		tap = tap_get_tap_dev(q);
+		tap = rtnl_dereference(q->tap);
 		if (!tap) {
 			rtnl_unlock();
 			return -ENOLINK;
@@ -1068,7 +1050,6 @@ static long tap_ioctl(struct file *file, unsigned int cmd,
 			ret = -EINVAL;
 		else
 			ret = dev_set_mac_address_user(tap->dev, &ss, NULL);
-		tap_put_tap_dev(tap);
 		rtnl_unlock();
 		return ret;
 
-- 
2.53.0

