Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108066;
	b=ru5xPNAdrVQtoowbwJnqmS1MKJUxxdwRIEMn49tuKEsIgTe0WSTkG7VjMKtRK1QZdUQ0
	 xFT5dUu2cNiQlOF3K+Qyp49jE54UapwT7rF6OgEJz9wVd4pqg2Wqdg4zsfGlK1utItq8V
	 4OH3dHWVGszNg6u2cKHh3EZsa0PwwMEvEr6qASgPtUDntJtLtn5dH4oAGuvkKCzUCfFlS
	 7gLRyr+2FT/omc//XXrsrnSDhdgBUbegZNhwnLf5YXhOVO0TJidXM3EJ1kKYNcq3/IHZ0
	 miq8OEQpRPpykTnOr7XISHeZgTh1NtsXBQccH/ZRCvaFiCj+suc9+KU/IsWYSgza8KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=2o0ILC3keCwMhrgGZ6aMyUvzYh9D8kgarIcL8NMwQRU=;
	b=M4XiTwqRqCzUGvp8J3HDWNlMLrdi3sRsVG6ZmcAxNC3HxWZHz1v0etrtU77jmlknXf2S
	 M1fHM5a8nB5eSLJMTZjOX/tWIiblgMxJT2zdCq370BEZmSo49Nal9stTaStD1FFZjw7+y
	 p9J7ezvmFarYd872KnxRK58hr+rB/+rdT7IPWP+v57rBA69oGZpBRFHRCIXpVOb2gI9K4
	 PYCuqVb2oZaGGI4mUWu+SBRf234GuZYkJPoht3CNSdh4ZC9RoDsr1dAqLbcij8mZHrAKW
	 W40kZzoXc5BuXjSrFRR8pSNtp4PjfAzE0sJBBDbnOqopTH8yF/xeKBwHazh+Y7JYXyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=clKMhSa1;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B840A606A33A
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B840A606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=clKMhSa1
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3724667bc16so872450eec.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 09:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108065; x=1795712865; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2o0ILC3keCwMhrgGZ6aMyUvzYh9D8kgarIcL8NMwQRU=;
        b=clKMhSa1k+t/zljcwothRCYDh/TYTRdBp+Wl4FETkpsD82WP7pE/1MV+Sb8UJWzLhM
         Weky1HjSqaeyUziUvD8fLkoKgaoGtU4+ELhwr/mx8G/vX+95RxbbWeKDGFeSzUPc/Ozc
         MHl9MaUPeaCDgVJ5MLt81jFJyjXcDOG+zS0P6c6xpzHZYOH/yleqZ7dD7fgFWv3AHsFa
         Mwy1GrYiQF/w7G4ZRFxB94ebNY87Zk0vZTJfsBmABSRLe1LVBsOITtVx9hoq+d4eR8nx
         8qokjHwZotSmKXmB0EJ0t7lPwwfbpO5PpKnZ5IseDX7CNrwWw+4o2O+0ry9wcR1xvp6N
         cH0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108065; x=1795712865;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2o0ILC3keCwMhrgGZ6aMyUvzYh9D8kgarIcL8NMwQRU=;
        b=xO4Tm/NLY9WoZsZVb+2gqKln5aq9ra9FKyDm8MgW6r5de0j3hDQBIhssFf8BNIrzo4
         9O6Jc1TEQhrbE/32A0eL73CgcWDlh4u8995TB4f/lz7W1L4l9PPwqeEGKaguwao0R5SX
         LuyV707I2qKN4324dJRZV9Me1YO2kJgsGrbkjJDqhw4zd1bCAGD507JohxQP63PAuRx/
         3Hl871xjt9y4nKZklGA0V0zz36K4aaSIqXulM5TIVIa81Axio/xL7nXpLJU8lzRCoTKK
         toGMa7xgIv6ilNMdEmA6aqaGgtmXP3KZRjVj/m9cgQqpE0u7+ZsXXreJXiWHbC9wPVWr
         iRCw==
X-Forwarded-Encrypted: i=1; AL+hErFo33ZzBZW0OoKTSSV3UpIQSq7Btiz3Zx43Q33+I2z4b2pRcYBWJnHZv0ZwFjEHpgL78MFQby8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qGsMwnsxAxgdiI8DR8i+KVTYvNhApaIc1bRqucyUZye81qjKa
	TK4E1ED2joceS91FrGaTerQY5oEuePPvNamBUSKQXRan3EgbDZQItJkbLPBpqAiH4lErZlpnG4U
	Eap7K1x2fVQ==
X-Received: from dyr9.prod.google.com ([2002:a05:693c:4009:b0:385:23b2:bccf])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:51d4:b0:384:fef7:5876
 with SMTP id 5a478bee46e88-384fef75c78mr1005650eec.24.1795108064646; Thu, 19
 Nov 2026 09:07:44 -0800 (PST)
Date: Thu, 19 Nov 2026 09:07:41 -0800
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170741.1525395-1-irogers@google.com>
Subject: [PATCH iwl-net] i40e: ensure owner VSI is found before dereferencing
 in i40e_veb_release()
From: Ian Rogers <irogers@google.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

i40e_veb_release() counts all VSIs attached to veb->seid in 'n', but only
assigns 'vsi' when I40E_VSI_FLAG_VEB_OWNER is set. If a non-floating VEB
has a single remaining VSI without I40E_VSI_FLAG_VEB_OWNER (for example
if the owner VSI was moved or cleared via debugfs switch operations),
n == 1 passes the 'n != 1' check while 'vsi' remains uninitialized on the
stack and is immediately dereferenced.

Initialize 'vsi' to NULL and refuse to release a non-floating VEB unless
both n == 1 and vsi != NULL.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wconditional-uninitialized enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 (-Werror) and
-Wconditional-uninitialized; not tested on Intel XL710/X722 hardware.

Fixes: 08cdde310e22 ("i40e: Fix broken support for floating VEBs")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/net/ethernet/intel/i40e/i40e_main.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/i40e/i40e_main.c b/drivers/net/ethernet/intel/i40e/i40e_main.c
index abbc71e815ae..8d4213b7dd92 100644
--- a/drivers/net/ethernet/intel/i40e/i40e_main.c
+++ b/drivers/net/ethernet/intel/i40e/i40e_main.c
@@ -14718,7 +14718,7 @@ static void i40e_veb_clear(struct i40e_veb *veb)
  **/
 void i40e_veb_release(struct i40e_veb *veb)
 {
-	struct i40e_vsi *vsi, *vsi_it;
+	struct i40e_vsi *vsi = NULL, *vsi_it;
 	struct i40e_pf *pf;
 	int i, n = 0;
 
@@ -14735,7 +14735,8 @@ void i40e_veb_release(struct i40e_veb *veb)
 	/* Floating VEB has to be empty and regular one must have
 	 * single owner VSI.
 	 */
-	if ((veb->uplink_seid && n != 1) || (!veb->uplink_seid && n != 0)) {
+	if ((veb->uplink_seid && (n != 1 || !vsi)) ||
+	    (!veb->uplink_seid && n != 0)) {
 		dev_info(&pf->pdev->dev,
 			 "can't remove VEB %d with %d VSIs left\n",
 			 veb->seid, n);
-- 
2.56.1.708.g77570a6a1d-goog

