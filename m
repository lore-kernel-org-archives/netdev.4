Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795126284;
	b=wSlJUVIwJVjKzOhkOaNaMRF+1CIYqVQosjJrihqVS5wdPs9JA2xSbLLdN/4nQcPymrAs
	 W2XsO4q4ddnoAdsjxUJccV6d2GkMJXNsy+7UFn4SfFWKxFlbQf4jGHMNzYesZlGvVOuTR
	 c16iyp5em5aQYhqK2RKYvKaZj9+/MxpbRfQheNjZ/+3nGgfHrzrZGRoIAn/1ZB9iBga8N
	 3EOYh+e9VKcW42emXMBnWJzvIIYjJhMx4Wja1hSQdSWXiEKuvPi/hdqTV87NsQ69YIbn/
	 E/2qmZMNxyHjsjL7sGecQcK3TB4r+oWMBI3nZ6Fu9R32TUdWhQGOHYc7xy/2eb3Aeng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795126284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5vpfg1BYLFaUTKymnO6evz0ij7VFfeLC/qAXtGRDUcU=;
	b=L9wJmQmKqaMJOSuTBVQtTJPPpNdwC00don2+jCa3sy+PVoo1XE/XcrvQgPYIxJQvbulG
	 +5/83KLAj6oWGc4Ls5oU5V56ATKnyN5q7tmR8j9W6VWU5CWQ2VxcabgBStd7H7UcVt/G5
	 aFAPQU4tS4up40EsxRzWKU9DIL0l/FlXuElZ9SRXJtSlut8BPlx9/W+vIJJUQbzOX4mm6
	 61q214MQpu+y5HsE0O2V9MuPvSIdfhTTxF/XcVRTdY7lWATZtDs8rlKXw3uCrCS1XHW+Q
	 KRlkK58Cy3+g+lN1c6LAkMN8ND473+Hrb6hU4gVD7sIH9vPpwetsdBXkUXuia0WdmUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MfFndmdy;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01602606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 22:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01602606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MfFndmdy
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdba1b5ed8dso91407a12.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 14:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795126283; x=1795731083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5vpfg1BYLFaUTKymnO6evz0ij7VFfeLC/qAXtGRDUcU=;
        b=MfFndmdyeYOhBgykgodjs8cPsL1GWA9EMQwmH6vHpGX/dV8ZvOd4WhmA+SMeyWWhg/
         Omf8dp8FH7oRivNKJIrkPBax1WCmeCONgBfEHpfvXZfn1/uqNVz6RoYGwJ9EhCbQpaHq
         fe2tm2G/L+By2KtWzECQU2FwEXWOVf8BzxhWwuRicI7yinWmirpVUBhF0Fd6FfPBPcK9
         HaS2CeXXUIwqZby0HlgbvzKfBC0sJR/bOb34xegl+VuTxvz9+onnk4BxDbX36+A+X8Rx
         ebpxZjf+wwKFWfF+TlnHJrKpOmWVFJen6blRd7LjZHLG6ENHozPL+eF2Z+iBXc2b1Q19
         7hnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795126283; x=1795731083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5vpfg1BYLFaUTKymnO6evz0ij7VFfeLC/qAXtGRDUcU=;
        b=DExIxizhlxRYQ88xA18kn3JMn4cdxSYgL9+JR9HdMstXySC5xajmGpGXSQZIQD57tx
         GC6ArkdNu9eO2USKHUhDCHJ71a3Pc6Gy2mz6NygWZ8vzixHc46qbhcsdhtYnyGS+bVDi
         AU4EERpsoW8lsQDBh0J+ylPSLAtd8InTz9xrNaOgdv8P543j6WDuRqcP1wcWqqytU/di
         ln+ojvfca+Ah40hIK3PAj0bx0k997ZVoZrg5UXX+R3EnsWqMMqJbksWDclPDd9xzmQa+
         A15w48bAlWWxL+jRzOnBlquah5URrmKT4FcQE72G2TqYgYZEY5SxP5VFyvKdAAmXTXbD
         6ALQ==
X-Gm-Message-State: APuU4Z+WkVbEbS8SrBZwPIgaFJxIZzc3iu9tMxBrdfPzSR1hwEeKn7kv
	KBx662HxwUh45ii+PBFoI4zmuM7lwjOOe287svWFa37Fl49LubZHtlRdHHG1OqZ9
X-Gm-Gg: AZFdTZdOrQZTRgbboSy0pd0SQ1wj4bclu1LI1okbe89cqS0ZFa+CvltMW9nDlTGQx8f
	BM8YOVhgCMNYzJL88tbW7D8hVrsbb7UUlGC3m9GnDb86cBQUsx2kX9GdENFMCeZUQ55o/MV9r+A
	dWh3itRuhnRTu5HT+7viZpAbfa6e9/BXPP7yan2bPgcCe8vl58Sbxl0eNaZ+TPbMEyCKFY91Igo
	7wiqoAJvRRI7U6ZESyqNNlqxIc228ZkEygKrqNY3rTX9Qy8OQlk3UpSAaO95P/teijqFg+mXQaO
	iaJ6JrmSf6EZqFwhCc2gHM8MiaOVfvkJJvgkLo/XISAbbwkzhCNtYYKhzZNaSry9XsfsI9vTBN1
	XIiDEzzQpht4WaSbsJS4woQVQzrACUDxFVn9287tC6RQEJe7AyC0cffUZ+6Ei4AoZr6Ud6II0qn
	jBq6MXNWsDC2E5ce7ddZmEHwHBVk2zP+Gg8QP0CU1f43dFHqwImU4r+xQ2S4EGt2Rt8lW31QYGF
	4euipdoaOGm24QGnAB4EM+ZrgQP+euEXD88h1jxBKiJqIny4ThpmGHPx/C+jowYU3ZOKYcsikRY
	cmjOTmNOseapoVDpAmGG9QaXoKzn8mNd4tQ6cuwpe9zl/Keao5E1
X-Received: by 2002:a17:90b:3b8f:b0:3ac:b3c7:de04 with SMTP id 98e67ed59e1d1-3b41c95f0e1mr487553a91.34.1795126283129;
        Thu, 19 Nov 2026 14:11:23 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac5:6213:28::4:379])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41d243eb1sm369348a91.3.2026.11.19.14.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 14:11:22 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net v3 1/3] net: dsa: motorcomm: Ignore multicast addresses in FDB ops
Date: Fri, 20 Nov 2026 06:10:41 +0800
Message-ID: <20261119221110.1123578-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119221110.1123578-1-mmyangfl@gmail.com>
References: <20261119221110.1123578-1-mmyangfl@gmail.com>
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

The software bridge never forwards according to an FDB entry with a
multicast MAC. A multicast entry created by "bridge fdb add" is
therefore inert in the software data path, but its switchdev
notification still reaches .port_fdb_add().

Ignore multicast addresses in .port_fdb_add() and .port_fdb_del() so
multicast entries are not touched from FDB side.

Fixes: 186623f4aa72 ("net: dsa: yt921x: Add support for Motorcomm YT921x")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index b12bf32f8896..eddec2f26586 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -862,6 +862,9 @@ yt921x_dsa_port_fdb_del(struct dsa_switch *ds, int port,
 	struct yt921x_priv *priv = dsa_to_yt921x_priv(ds);
 	int res;
 
+	if (is_multicast_ether_addr(addr))
+		return 0;
+
 	mutex_lock(&priv->reg_lock);
 	res = yt921x_fdb_leave(priv, addr, vid, BIT(port));
 	mutex_unlock(&priv->reg_lock);
@@ -876,6 +879,12 @@ yt921x_dsa_port_fdb_add(struct dsa_switch *ds, int port,
 	struct yt921x_priv *priv = dsa_to_yt921x_priv(ds);
 	int res;
 
+	/* The software bridge never forwards according to an FDB entry with a
+	 * multicast MAC, do not touch it from the FDB path
+	 */
+	if (is_multicast_ether_addr(addr))
+		return 0;
+
 	mutex_lock(&priv->reg_lock);
 	res = yt921x_fdb_join(priv, addr, vid, BIT(port));
 	mutex_unlock(&priv->reg_lock);
-- 
2.53.0

