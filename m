Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795763708;
	b=QImrFqsRFJzL8mwj2FJFY5XjcaZoCryXLrcoHTNZqwG4aYqemyI8sIacYL1Zf9nGD02Y
	 GUyXS42c4JFSz4asQjlJanP+erLDAMQizJRUkvy2T/E6dlxAujl1y/kEzKqk2BU6q1nqf
	 PPec5iuez1VUMT0+XE3tqtzIoTUumyudVrV0SE3Sx1Tm3os7h1Y26vGKs993xrnr7pajZ
	 2YEg0AyDoIkmJJH1ZrzSxMfHOp5mJ1VWTZ2CMxEFaVav+3J+lXSyMSY2GfLV9rucz0H+7
	 JKoevftbqB6Yfniyia+8zmjeRW8PrqiJ96dBq2W6t+vKhlNlFfsbFBMul8oJKwNNbEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795763708;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sdHeVGtyJhV98HK8k0GuhRxGfmBtLYuJT4oh96DWm9U=;
	b=Z7f4Ew06hwkZcvvxTZ7m3FHoXo2AWNLHg2N8WBLeyna86fCdMs1WeqJ2dwBbq45O2yG+
	 XG8rIFqf9wcuF0f6f7n64u1Nd6xbuqqFUuUT9jRy/3jdaSRBPMyt8ooehxlzz2sKSvz/i
	 CNgUUPQCicvc12Y/ZYXlx87KpLTfKOiieAv4Pg6iTooYjmsNVlDWa7Mulv3fgwhYGIs9E
	 PyZVzU7MgWzwm3JnnqdJu0VQ2X8qGsea/7Gkyr7HJj7Qtn9+qvQ9McxLnjqbpyacYmKaE
	 hlHeDQiQyIFPBkqq246+I/alh/qaXxpqabWkbTYe0jCrZTstiKTublgGGd9zfkT1TnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=kVacH+FV;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91892606A324;
	Fri, 27 Nov 2026 07:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91892606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=kVacH+FV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=kVacH+FV8yfpcKk8v/nyGFqL8DYtZHeWDGJJA0MXeowJL612xIt0KD2ncuUAQvgfZPHdNDTjkiL9b
	 caSoaVzncnM3o+1ImTQmgINmUKTjAJNqsicHqmOlRjkmDdtM9cibdSzHDtaYx9y2904aGNJ3OxNbCU
	 8HiJldf4zFkOcCyo=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26b092df60bd-9fa18;
	Fri, 27 Nov 2026 15:15:02 +0800 (CST)
X-RM-TRANSID:2ee26b092df60bd-9fa18
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76b092df40d7-8acc7;
	Fri, 27 Nov 2026 15:15:02 +0800 (CST)
X-RM-TRANSID:2ee76b092df40d7-8acc7
From: tongzhiwei <tongzhiwei@cmss.chinamobile.com>
To: Jiri Pirko <jiri@resnulli.us>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: tongzhiwei@cmss.chinamobile.com,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Jiri Pirko <jiri@nvidia.com>
Subject: [PATCH net-next v2] lib: objagg: Fix stats imbalance on hinted-parent error path
Date: Fri, 27 Nov 2026 15:14:45 +0800
Message-ID: <20261127071449.551-1-tongzhiwei@cmss.chinamobile.com>
X-Mailer: git-send-email 2.45.0.windows.1
In-Reply-To: <20261106095621.143-1-tongzhiwei@cmss.chinamobile.com>
References: <20261106095621.143-1-tongzhiwei@cmss.chinamobile.com>
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

This issue was discovered by an AI code review agent during static
inspection of the hinted-parent error path.  It has not been
triggered or observed at runtime; the analysis was confirmed by
inspecting the code, pairing __objagg_obj_get() with
__objagg_obj_put() on the success path.  The fix has not been
runtime-tested.  Its only build validation is the automated netdev
build tests run on the v1 submission (identical diff), which passed
with no new warnings.  The fix and this commit message were
prepared by the same LLM agent and reviewed by the human submitter.

In objagg_obj_init_with_hints(), the parent is obtained via
__objagg_obj_get() which increments only the refcount without
touching stats.  The matching release for internal references is
__objagg_obj_put() (no stats adjustment), as used in the success
path in objagg_obj_parent_unassign().

However, the error cleanup at err_parent_assign calls the public
objagg_obj_put(), which additionally runs objagg_obj_stats_dec(),
decrementing user_count and delta_user_count with no prior
increment.  This corrupts the parent stats, leading to
under-reporting and potential user_count underflow.

Use __objagg_obj_put() to match the internal __objagg_obj_get().

Fixes: 9069a3817d82 ("lib: objagg: implement optimization hints assembly and use hints for object creation")
Signed-off-by: tongzhiwei <tongzhiwei@cmss.chinamobile.com>
Reviewed-by: Jiri Pirko <jiri@nvidia.com>
---
V1 -> V2:
- add the net-next tree designation to the subject
- add the Fixes: tag for the commit that introduced the
  hinted-parent error path
- collect the Reviewed-by tag from Jiri Pirko.  Thank you for the
  review, and sorry for the slow follow-up!  The diff is unchanged,
  so the tag is carried over as-is
- replace the "NOTE: this commit is worked by llm completely" line
  and the "Assisted-by: LLM" trailer with the plain-English
  discovery and testing statement above, per the "Bug fixes"
  section of Documentation/process/maintainer-netdev.rst
- no code changes

v1: https://lore.kernel.org/r/20261106095621.143-1-tongzhiwei@cmss.chinamobile.com/

 lib/objagg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/objagg.c b/lib/objagg.c
index 23c7105a3f9f..6c4144213eb8 100644
--- a/lib/objagg.c
+++ b/lib/objagg.c
@@ -327,7 +327,7 @@ static int objagg_obj_init_with_hints(struct objagg *objagg,
 	return 0;
 
 err_parent_assign:
-	objagg_obj_put(objagg, parent);
+	__objagg_obj_put(objagg, parent);
 	return err;
 }
 
-- 
2.43.0



