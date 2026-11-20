Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162378;
	b=kIRx3si2lsBS8/cTG0pUz2WFYANKHnVAsE7vztjAk5Fs46b8YaLGMJXEfhi++7SZ8VI0
	 ZIaXHFmSNsKrHLV/pWgi7TmJE+37Tp4D5z+OegbqNV8JH22ZNmoYVBJU3Jw6fDv1XQzeU
	 5+dq1nsB6j1VQCWQN/4Q+GowviYP3YNavDaQdvGqFshyrSmtZuCPfwRSuO7d47xx9wkQf
	 Jq2WieCjEmDOJSO3/yG15src9dXguSd3AQDOU2nbA37ZXqIrMlmtVS+qz16t2hPdfTCBj
	 Iud4zOp6IwTbFRarDQXOFtJobUu0eeK8U4wWD+nUN2miyGj2INp9KDQCZebXSD3vVrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162378;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Spam-Flag:X-Spam-Level:X-Spamd-Result:
	 X-Spam-Score;
	bh=C90rrP7KJHqoSFgzxtV19Wc0HvG2xNRydf0PBWxlx9g=;
	b=Hsgi4whihqGk8uKF6nol/7m5NbUBp8Om4bskfnQCbyneHzBJjNb7OFciQTy4b/38rv0r
	 4Zba3RyH+vHziYQNlr/9azZ5T3RXHFzbi/JoQ0M+9Ft32AyNIJ0sF2bB0wA8wtzFiS7xW
	 FzMapctubRI9tkatMwL7oRWT1slVo9O6YLU7tBU7EPeDun7uGCba/17SsJ5WIzx2/KNl1
	 phmO9bvOPww51zxH1WUI9oJMbuIyy4BxPiDbpfNHoVkTchezCFRSXm8YFj6b0VZpwXWT6
	 ohd4c09c8wMnP+FpHIVmQYZayc7gnSSAkE+qJ2eqLRFzssfbG96Iiwjk+jMeLlsGh1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=rtt7f51p;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=rtt7f51p;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC32606A338
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 08:12:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BC32606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=rtt7f51p;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=rtt7f51p
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6ADD61FA79;
	Fri, 20 Nov 2026 08:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1795162374; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=C90rrP7KJHqoSFgzxtV19Wc0HvG2xNRydf0PBWxlx9g=;
	b=rtt7f51p5utY1GQFkgzM7zpTaO+QfTpjTeeanauddGjQeA1Sz6YpJCrPZTnkBQJ8ZoSBIN
	mh42IGWwltn4gY4yYojs7zBKvlanKh64YWn50Uk3mFqp26siEbDrUbrKXxq4770sBC4Kul
	wZIzMk2r979xFSnyc66oIp8NMoHUXP8=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1795162374; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=C90rrP7KJHqoSFgzxtV19Wc0HvG2xNRydf0PBWxlx9g=;
	b=rtt7f51p5utY1GQFkgzM7zpTaO+QfTpjTeeanauddGjQeA1Sz6YpJCrPZTnkBQJ8ZoSBIN
	mh42IGWwltn4gY4yYojs7zBKvlanKh64YWn50Uk3mFqp26siEbDrUbrKXxq4770sBC4Kul
	wZIzMk2r979xFSnyc66oIp8NMoHUXP8=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 020621348F;
	Fri, 20 Nov 2026 08:12:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mSmxMQUBAGtgKgAAD6G6ig
	(envelope-from <nik.borisov@suse.com>); Fri, 20 Nov 2026 08:12:53 +0000
From: Nikolay Borisov <nik.borisov@suse.com>
To: davem@davemloft.net
Cc: kuba@kernel.org,
	dsahern@kernel.org,
	netdev@vger.kernel.org,
	Nikolay Borisov <nik.borisov@suse.com>
Subject: [PATCH] ipv4: fib_rules: Switch to using a for loop in fib_empty_table
Date: Fri, 20 Nov 2026 10:12:42 +0200
Message-ID: <20261120081242.318541-1-nik.borisov@suse.com>
X-Mailer: git-send-email 2.56.0
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
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-11.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email]
X-Spam-Score: -11.80

Since commit efdfb1e27a33 ("ipv4: fib: bound automatic table ID allocation")
added a sane bound to the loop looking for a table id the concerns in
58075ff523af ("ipv4: fib_rules: Fix possible infinite loop in fib_empty_table")
are rendered moot. Just revert the code back to a "for" loop, using the
new bound. This makes the code's flow and terminating condition a
lot clearer.

No functional changes

Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
---
 net/ipv4/fib_rules.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/net/ipv4/fib_rules.c b/net/ipv4/fib_rules.c
index 060501b376a8..7fe3ec07618a 100644
--- a/net/ipv4/fib_rules.c
+++ b/net/ipv4/fib_rules.c
@@ -218,15 +218,9 @@ INDIRECT_CALLABLE_SCOPE int fib4_rule_match(struct fib_rule *rule,
 
 static struct fib_table *fib_empty_table(struct net *net)
 {
-	u32 id = 1;
-
-	while (1) {
+	for (int id = 1; id <= FIB_MAX_AUTO_TABLE_ID; id++)
 		if (!fib_get_table(net, id))
 			return fib_new_table(net, id);
-
-		if (id++ == FIB_MAX_AUTO_TABLE_ID)
-			break;
-	}
 	return NULL;
 }
 
-- 
2.56.0

