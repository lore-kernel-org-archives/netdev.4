Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795800042;
	b=Q7cIqhuRHTLEUfjCZ077VCs7+YrKQv5u0pskjNLhQpdfQWcDRbAUtj2CwZB+AgVWyNC5
	 wnwjULEGk7hHFACSS1KwA2MC8ONvBLveijT9wKq+lK+SpXEm7dZ3ekUn2MnoX6cgfHEms
	 f6dsbocgp7uW6sZwWMbOXYdjcOklB+KiXRyx5IGDGDzuhorjaxSNa2B72CFo+8iSc7fJC
	 sFBa0xfMcD81XOWFI1bM9vxn9519PgDIQJ1PyEotkn72Cj9o3ug7/2sXUZ0yyLPv1P3t3
	 Wptho3W0e5m7wKQlNFtbDUAKcI0CXUO2P+8IaiOg51LH3xkY00RgVDWKnhpX/k4clmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795800042;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Pre-Result:X-Rspamd-Queue-Id:
	 X-Rspamd-Pre-Result:X-Rspamd-Action:X-Rspamd-Server:X-Spam-Level:
	 X-Spamd-Result:X-Spam-Flag:X-Spam-Score;
	bh=QydS19oSkNCTTBPLLeZxya3Ay1kS6ux9KdOCRVuTgRY=;
	b=jogP0bL1+8H0p+yX2oljPZLMWvwQTo4QbDeTK0tg5yy6vRnFRBT5oHwfuP5CkrO8fv9v
	 OLYNeqf1DPhl9Pp1j2gi+OljaubHvJiQWZY+TnAWc+Q4bBRk2FlTS4gK5DqUZQ2Lz0ffn
	 6sL5c/+oPe9B0sQLmqX0Hdp1GlW+eGyDijFsjrL8+b14pUsKY+8ZP2lQFKIn2ft5BCpph
	 ynd+1JTb3BuHw6GnuVhf066Fwv0uxHT8381lB5cXdM0J7syLnL4qlzMCjad5fVPD5w27Y
	 rJn4/5MqpE3DXRx9X8nWYHK/Vw5wc0O28LIrqIvOvf5DeNU0zPOPd6qhzqulTqPgR/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFCE606A33E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 17:20:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EFCE606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F41EA229B4;
	Fri, 27 Nov 2026 17:20:39 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3405C13432;
	Fri, 27 Nov 2026 17:20:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /Yb1MH67CWuMAwAAD6G6ig:T17
	(envelope-from <fmancera@suse.de>); Fri, 27 Nov 2026 17:20:39 +0000
From: Fernando Fernandez Mancera <fmancera@suse.de>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	kuba@kernel.org,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	Fernando Fernandez Mancera <fmancera@suse.de>,
	Willem de Bruijn <willemb@google.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Tim Fuechsel <t.fuechsel@gmx.de>
Subject: [PATCH net-next v4 16/16] ipv4: make CONFIG_IPV4 boolean
Date: Fri, 27 Nov 2026 18:18:01 +0100
Message-ID: <20261127171824.27362-17-fmancera@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127171824.27362-1-fmancera@suse.de>
References: <20261127171824.27362-1-fmancera@suse.de>
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
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Queue-Id: F41EA229B4
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00

Change CONFIG_IPV4 from hidden 'def_bool y' into an exposed boolean.
This allows users to explicitly disable IPv4 via Kconfig to build
IPv6-only. The default is kept at 'INET' to prevent breaking existing
configurations.

Signed-off-by: Fernando Fernandez Mancera <fmancera@suse.de>
---
Sashiko: Yes, disabling IPV4 will currently disable many relevant kernel
modules. I acknowledge that in the cover letter. This is just an
introductory series and many patches will follow-up so we can respect
the 15~ patches series in netdev. I have more work prepared to send once
this is merged.
---
 net/ipv4/Kconfig | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/Kconfig b/net/ipv4/Kconfig
index f34e31f06c7f..8b7f4a0613fb 100644
--- a/net/ipv4/Kconfig
+++ b/net/ipv4/Kconfig
@@ -3,7 +3,15 @@
 # IP configuration
 #
 config IPV4
-	def_bool y
+	bool "The IPv4 protocol" if IPV6
+	default INET
+	help
+	  Support for IP version 4 (IPv4).
+
+	  Disabling this option compiles the kernel networking stack without
+	  IPv4 support, resulting in a IPv6-only system.
+
+	  If unsure, say Y.
 
 config IP_MULTICAST
 	bool "IP: multicasting"
-- 
2.56.1

