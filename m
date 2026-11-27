Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795819067;
	b=tH2RxLi+qByw3a3rRPTUGB5YQDchq1jWVrKFJ3/k+LPMBZ9pIC8/YMo5VYA8Prbif0nD
	 +EhQfMAolwtM6BaNLxJO7Lf8vlWs1wuMfVFsOnxKnyOyUwSboK51e1zWVaT4VGq9WaIne
	 d9DHLEPk34JsjtvmyF9VdTEMcrbrXWJ5OzW1ReDl30z4wvMNXq4arRpudk2CDWWDELXzR
	 eM9BXxYPD2Y63KzkoaKRZy9YUJWC711Op7ChItI7ZO5FeJBZneY+O+Hlfd35Gt/x0fscH
	 53cfxCsZoqIIoRBMYUa+n66msP2fCOniN3el14/SKQN+jkkzhVwkMTJnwbGgnKG++lA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795819067;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=KwU8LOjtrpYBs21veejOzZaPfblYKFwSoQI945HcW4g=;
	b=SZw0tddtyutErsfBSae3gZz59sR828JitGN/8TlEZpXJmq1dYbRUOo6qyg53peWOonZA
	 Av8Tky9zb8Rp0htkEwk6bdBIF/JJT8OKgkmu1fX0OxjSAjjd23miyuGM8HcWuOo/BIjyX
	 a43XvW08GJX3a6gsOKr9IaBQfOJ+8MSRfMEI8tm7DR/F1jsJV/4qCH/5VVAQ4Yx5tN3Mc
	 fWBmlRmGIKlfRnuALnnnpS9kyvbLj9iHLRharEwnE08ZoQsTXToNK1vyRftr/xXeGhqLM
	 8ZNvNH+NfpMokEo8gO60JN2niUTAFu+jbiZU3KSt1akBFrueKq8dxa18bMKUErGPXSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WV9n+5OI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8A2606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 22:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WV9n+5OI
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795819067;
	b=cILfTJ11qJxpBHG6JLF2u0d1CDkAT40IdS/WH8muosTfXDAdT+P3wcK1Y/nowl/+0Qwd
	 SDMnbe9G6Kp0FsD6MXK1qgw+CKZgXXHg5SbGurcuAEDs/V+WSBIY1PVFeWHCCtW3+1tLh
	 R3OVyJj7YcZQRbAm+AS2FeytX8KRTOasCflF2BaqIvB0xDedgtXP0l9/+Hzr+bLn29FZm
	 IZZ6OfauIrKZjHlZm9iPiK7M9qY153Iy6FNpLC9UO3AHMx2mt4JxJth7eC6nyQ2H5DrFT
	 WnpZ0WUNPMrvHezDlncisv47oG14saIIVi3ppbIE8L2pyivDXnxSqHmpr11b3kXv4Mw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795819067;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=KwU8LOjtrpYBs21veejOzZaPfblYKFwSoQI945HcW4g=;
	b=wi6oPzfOeI1fC/2pdxaxvD/yz/7NhjuK5J7+hlYibIbzrJZ1HOCbUbYxNbgBAPH012VN
	 cfdTduX1l6zq8P0nUhIipJmkwSjPw8wqPmbYTGbJPmDisDlHgDYyHbLoiFsGdEkH1xSqN
	 4lq+Tp3sH1leIkDgFNdI8buX97raEZS4ZVI9Q0N5cMp6i4CojjwQYUORbkqEiBuHExSfr
	 h9JAU5gB8DfcHOlktMSGaaY43k+K3RADzt1GGf8egTkkuteIVguFTUM+p9dK7rMkkTbXK
	 /pIS+R4U8Y0rRG1+AWRzakr+8ZvhqOSBfQoySa1sUG1YbNK0V9TLLivMHDFdBIiqTxg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2D8221F000C1;
	Fri, 27 Nov 2026 22:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795819067;
	bh=KwU8LOjtrpYBs21veejOzZaPfblYKFwSoQI945HcW4g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=WV9n+5OINCrGtk8P0O3Qs5ZvsoIcilLGwbYmvUHpQ1EPdm84/sonUVfKmx663HmzX
	 tQk2LTQvhonGE0Q4KoXSZNq0xrrivEx8ltiSrYgeKDVxIPk5woPsgPRJCFrWPUrcl2
	 78r2t7/O4OUcCcRPwTTA8o1rBUbL2hgJCCzuvT52uvxzlNSlLY6BQ3xkzWHSKyE9YP
	 I9Zrvzq0uAK8E/RSEv06lo/TB18FdFMslYZjaV/2yogKnklDJmpIFS+i9M7k17bfQq
	 bRpuyt9DzS5wZ1GC1yfwcDgEbUOaL3UdWf0SpIjWD38koqUxOnaxYMyeh9fGYfACv5
	 42fPx7tvamtjw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A5B194DE48;
	Fri, 27 Nov 2026 22:37:44 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Fri, 27 Nov 2026 23:37:39 +0100
Subject: [PATCH iproute2-next 1/3] uapi: add the attributes of the lisp
 devices
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-iproute2-lisp-v1-1-df8ea175bc06@free.fr>
References: <20261127-iproute2-lisp-v1-0-df8ea175bc06@free.fr>
In-Reply-To: <20261127-iproute2-lisp-v1-0-df8ea175bc06@free.fr>
To: David Ahern <dsahern@kernel.org>, 
 Stephen Hemminger <stephen@networkplumber.org>
Cc: netdev@vger.kernel.org, Matthieu Baerts <matttbe@kernel.org>, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795819063; l=835;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=90Pl+kHygIdW1VdLUKQtrTeLJu8UNvjTfSyw+LojGJA=;
 b=8NfhLKJZM2eWQhdZ+sX8biCzIKhlUsJZH2N20+GH5fuSf5WUGUOwOB7safB1YlTdIcmD5bSGw
 hQVeCiHZ/KXBccuKoRq25Dew7rWWq2nt+anonMfL0VqzSf56BCK2ZE0
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr
Content-Transfer-Encoding: 7bit

From: Vincent Jardin <vjardin@free.fr>

Use IFLA_LISP_* from the uAPI header of the kernel

See:
  https://lore.kernel.org/r/20261126-for-upstream-lisp-v1-v1-0-7382a4bcfd9b@free.fr

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 include/uapi/linux/if_link.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/uapi/linux/if_link.h b/include/uapi/linux/if_link.h
index 7ce01d81..786a16b3 100644
--- a/include/uapi/linux/if_link.h
+++ b/include/uapi/linux/if_link.h
@@ -1536,6 +1536,18 @@ enum {
 
 #define IFLA_BAREUDP_MAX (__IFLA_BAREUDP_MAX - 1)
 
+/* LISP section */
+enum {
+	IFLA_LISP_UNSPEC,
+	IFLA_LISP_ID,
+	IFLA_LISP_COLLECT_METADATA,
+	IFLA_LISP_LOCAL,
+	IFLA_LISP_LOCAL6,
+	__IFLA_LISP_MAX
+};
+
+#define IFLA_LISP_MAX (__IFLA_LISP_MAX - 1)
+
 /* PPP section */
 enum {
 	IFLA_PPP_UNSPEC,

-- 
2.43.0


