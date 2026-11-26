Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696305;
	b=Kjkiy2In1/x62kH7sajsbytNycN7J0er4+7E4CmzHD16spM0xwscx82LIQy/NgqwCvwz
	 FGGJllrfdZSAesEDC0XWck1+A3YWiXWjkNsTiXkmn8QVNyKEP2PoRSLH36tlpz8AOhkAd
	 BSFrLoqA66/VSRB2TWzXCc7/RMV27Hh24OgoRBm+nXaWk2Vs5b4AyUhIUeHVcfxaVi7hx
	 tCo8a2zsAk1k3GhlVAUy/fHBlVH7BVDPMwwusRv5Q1sB0mVQN2ncEnM4Wj9vbLdMTfB7A
	 /taIGhXkqqmKFn454x+PZih3jruCyYrJYJy+EPbg1YsQrcZr9aIyiUcwYREYZSOVzLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696305;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=RtyNGEelbIZDyipTekjJ45iDxVB44N9r7jXvjzEw3D0=;
	b=Nbt7ertj7VGtC6MMTSL8U9nltHgo3M0vy6PFXhyxS7FBI2eNPrAcUaSo+5d15G5RkpFO
	 Y8S6dvma+mCsLhzHZe4LnBRhyKGigEmTNn0gBSuJtE9LzkBlSx2H8yjbMtwhA69Y6LfBe
	 2fKHOoFamAzN0NuKj/GIjVkPNQq6sw0Dgtg1GreHP012r7Zs0KDWkhgiVStGfRYly07R+
	 PST0bCDQ0Dr6fcLyyzutloH4qnGIm4A9mT3q8kaSBuL2WUfgMmpZrXceUHh1gau6tOM+O
	 Mwzo/IIXw2XCrtVSuo3BWPKgD3eF8jkiRBcztyAdBtBWVdEMmt6sNDqGaLWVMXcSHOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SY8kOniG;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E0E606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 12:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03E0E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SY8kOniG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795696303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RtyNGEelbIZDyipTekjJ45iDxVB44N9r7jXvjzEw3D0=;
	b=SY8kOniGLm1IENB4bgR48uMuqvnJVU8WS/U/whvCrAwmdwRoQjMyS67IVqT8n3n1jOvRyY
	8hcbvaWmSxMK20vGFVVwAGRlQSy2wvr2JO1mg5ETW5A2E8wYI7ndMzGyFvmQDQ6FvscHDg
	ulgYCqU7YZZvqKl60/WkIhDpSHHit9I=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-110-cWeMPNV1MfeXjxEDY4Perw-1; Thu,
 26 Nov 2026 12:31:38 +0000
X-MC-Unique: cWeMPNV1MfeXjxEDY4Perw-1
X-Mimecast-MFC-AGG-ID: cWeMPNV1MfeXjxEDY4Perw_1795696297
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3B125180025B;
	Thu, 26 Nov 2026 12:31:37 +0000 (UTC)
Received: from jramaseu-thinkpadt14gen5.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7DB0130002C2;
	Thu, 26 Nov 2026 12:31:34 +0000 (UTC)
From: Jakub Ramaseuski <jramaseu@redhat.com>
To: anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	intel-wired-lan@lists.osuosl.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	Jakub Ramaseuski <jramaseu@redhat.com>
Subject: [PATCH iwl-next 1/3] ice: release the profile ID on ice_add_prof() error paths
Date: Thu, 26 Nov 2026 13:31:12 +0100
Message-ID: <20261126123114.893916-2-jramaseu@redhat.com>
In-Reply-To: <20261126123114.893916-1-jramaseu@redhat.com>
References: <20261126123114.893916-1-jramaseu@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

When no profile ID matches the extraction sequence, ice_add_prof()
allocates a new one. If ice_update_fd_swap() or ice_update_prof_masking()
then fails, it returns without freeing the ID, and if allocating the
profile map entry fails, without dropping the reference it took. Either
way the profile ID, a resource of the whole device, is leaked.

Free the ID on the first two paths, and drop the reference on the third
before jumping to err_ice_add_prof.

Fixes: 31ad4e4ee1e4 ("ice: Allocate flow profile")
Fixes: 148beb612031 ("ice: Initialize Flow Director resources")
Fixes: b199dddbd399 ("ice: Support non word aligned input set field")
Signed-off-by: Jakub Ramaseuski <jramaseu@redhat.com>
---
 drivers/net/ethernet/intel/ice/ice_flex_pipe.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_flex_pipe.c b/drivers/net/ethernet/intel/ice/ice_flex_pipe.c
index 2a054d3abd466..6d619eeaf0190 100644
--- a/drivers/net/ethernet/intel/ice/ice_flex_pipe.c
+++ b/drivers/net/ethernet/intel/ice/ice_flex_pipe.c
@@ -3065,14 +3065,18 @@ ice_add_prof(struct ice_hw *hw, enum ice_block blk, u64 id,
 			 * during Tx.
 			 */
 			status = ice_update_fd_swap(hw, prof_id, es);
-			if (status)
+			if (status) {
+				ice_free_prof_id(hw, blk, prof_id);
 				goto err_ice_add_prof;
+			}
 		} else if (blk == ICE_BLK_FD) {
 			ice_disable_fd_swap(hw, prof_id);
 		}
 		status = ice_update_prof_masking(hw, blk, prof_id, masks);
-		if (status)
+		if (status) {
+			ice_free_prof_id(hw, blk, prof_id);
 			goto err_ice_add_prof;
+		}
 
 		/* and write new es */
 		ice_write_es(hw, blk, prof_id, es, symm);
@@ -3083,6 +3087,7 @@ ice_add_prof(struct ice_hw *hw, enum ice_block blk, u64 id,
 	/* add profile info */
 	prof = devm_kzalloc_obj(ice_hw_to_dev(hw), *prof);
 	if (!prof) {
+		ice_prof_dec_ref(hw, blk, prof_id);
 		status = -ENOMEM;
 		goto err_ice_add_prof;
 	}
-- 
2.56.0

