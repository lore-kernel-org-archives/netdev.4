Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683939;
	b=Z/dDvlJhYbng+kdjenqMnYY+8xYvO/GxXoB7qTv+FOJjXtxLRGlZv3F08ENUdUYRvuNE
	 1fhTTjMEKSesFvDYGqBKhC8rGbUocekxTVCNbeANvUN4cL3yZvZY/5JNqOQF8cxw8/aeS
	 4RK1dLPiQVmvoRvA/4mWbqANnurJxFkIvqTzNbmv6EappPqNhpka4gJQujl9hCC/74NNg
	 87RuiD31IEaCAO7xyKSgjG/gV5VGlaRUgD2cGH1gadcBcO+iDWEqyEp7cEDRuLK0Zxkjt
	 uUifmPj3WkTyCjsMcav3BjaNYxrTJs/7mYQQdekJWnmw7+gv/wdfJp1+d6jRtzNVfQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683939;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=5YB4gCt4M6OMnWrIPuEP8EnKlBg5sXTJw5ThjcA32d0=;
	b=1UTckN9Q1+8m9IMd8/fV5WSrxzNMgpONaIrJ7698mBd9GHR2jgQarIoNImv13bte+PDy
	 K860os2SWvtp+EAi5HYJRI4FW/dTn7SN1oxhp8W7ybxcuQy/8sjg6ldj+s9rZXIGTKAiE
	 iaZCLOg+Y+J3AB2Rea9TaYOgUULdOmw3KhUWeQoApRSARjnlnc7B5VfgGYP+UYez2ncq9
	 7wS3Uzd4uRL5quWrtc49WdcoFIN/stgwqGkub/ChO73Afc21tLio7vrZViSyGrXgUDVRI
	 8BG5AYWqE4zCPSegqV4Qi2/2X9OiGjqsyM2Wjay5HV07ehT88FUvZ5Bvx/zXAsmg6gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jMy1J+Cz;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3C2606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 09:05:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB3C2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jMy1J+Cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795683937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5YB4gCt4M6OMnWrIPuEP8EnKlBg5sXTJw5ThjcA32d0=;
	b=jMy1J+Cz+iUZXbNEUy3wpml1xulRfBFWlo0cptaMXGaDt4DVAYrTlZYUP2aGTJc7/89mG0
	GgyCyEyvNFfZgeSXt7pEf7AfK5TNu2yCcJSh9QoxxJYDuPA3E/jDJiB+W8bVYWCOqpQYSB
	Lzad9mqTGiIP7xjIgOCHfrwR9SFp7CY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-218-Dk79X1VlMuSR4aurm3KjaQ-1; Thu,
 26 Nov 2026 09:05:35 +0000
X-MC-Unique: Dk79X1VlMuSR4aurm3KjaQ-1
X-Mimecast-MFC-AGG-ID: Dk79X1VlMuSR4aurm3KjaQ_1795683934
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D2F9A1956049;
	Thu, 26 Nov 2026 09:05:33 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.48.12])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B24C341F;
	Thu, 26 Nov 2026 09:05:31 +0000 (UTC)
From: Petr Oros <poros@redhat.com>
To: netdev@vger.kernel.org
Cc: Petr Oros <poros@redhat.com>,
	David Ahern <dsahern@kernel.org>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Ivan Vecera <ivecera@redhat.com>,
	Jiri Pirko <jiri@resnulli.us>
Subject: [PATCH iproute2-next 3/3] dpll: add the state-connected-override pin capability
Date: Thu, 26 Nov 2026 10:05:12 +0100
Message-ID: <20261126090516.4278-4-poros@redhat.com>
In-Reply-To: <20261126090516.4278-1-poros@redhat.com>
References: <20261126090516.4278-1-poros@redhat.com>
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
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

DPLL_PIN_CAPABILITIES_STATE_CONNECTED_OVERRIDE is the kernel capability
of pins that can be set to the connected state while their parent
device is in automatic mode. The uapi header in iproute2 already has
the flag, but the tool does not know it. A pin with the flag is shown
as "capabilities: 0xc state-can-change" with no name for the new bit,
and the JSON capabilities array leaves it out.

Add the name to the text and JSON output and describe the capability
in the man page.

Signed-off-by: Petr Oros <poros@redhat.com>
---
 dpll/dpll.c     |  4 ++++
 man/man8/dpll.8 | 10 +++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/dpll/dpll.c b/dpll/dpll.c
index 8dc1b8f5033fea..cc7da615f6beca 100644
--- a/dpll/dpll.c
+++ b/dpll/dpll.c
@@ -1534,6 +1534,8 @@ static void dpll_pin_capabilities_name(__u32 capabilities)
 		print_string(PRINT_FP, NULL, " priority-can-change", NULL);
 	if (capabilities & DPLL_PIN_CAPABILITIES_DIRECTION_CAN_CHANGE)
 		print_string(PRINT_FP, NULL, " direction-can-change", NULL);
+	if (capabilities & DPLL_PIN_CAPABILITIES_STATE_CONNECTED_OVERRIDE)
+		print_string(PRINT_FP, NULL, " state-connected-override", NULL);
 }
 
 /* Multi-attribute collection context */
@@ -1587,6 +1589,8 @@ static void dpll_pin_print_capabilities(struct nlattr *attr)
 		print_string(PRINT_JSON, NULL, NULL, "priority-can-change");
 	if (caps & DPLL_PIN_CAPABILITIES_DIRECTION_CAN_CHANGE)
 		print_string(PRINT_JSON, NULL, NULL, "direction-can-change");
+	if (caps & DPLL_PIN_CAPABILITIES_STATE_CONNECTED_OVERRIDE)
+		print_string(PRINT_JSON, NULL, NULL, "state-connected-override");
 	close_json_array(PRINT_JSON, NULL);
 
 	print_hex(PRINT_FP, NULL, "  capabilities: 0x%x", caps);
diff --git a/man/man8/dpll.8 b/man/man8/dpll.8
index c1d4a75e072dc8..fb8276fcdc5688 100644
--- a/man/man8/dpll.8
+++ b/man/man8/dpll.8
@@ -294,7 +294,8 @@ Configured frequency and supported frequency ranges
 .IP \[bu]
 Measured frequency in Hz (when frequency monitoring is enabled)
 .IP \[bu]
-Capabilities (state-can-change, priority-can-change, direction-can-change)
+Capabilities (state-can-change, priority-can-change, direction-can-change,
+state-connected-override)
 .IP \[bu]
 Phase adjustment range, granularity, and current value
 .IP \[bu]
@@ -549,6 +550,13 @@ or priority within parent-device relationships.
 .B direction-can-change
 The pin's direction (input/output) can be modified.
 
+.TP
+.B state-connected-override
+The pin can be set to the connected state also when its parent device is
+in automatic mode, which overrides the automatic input selection. When the
+pin is disconnected again, the device returns to automatic selection. A pin
+with this capability also has state-can-change.
+
 .PP
 Use
 .B dpll pin show
-- 
2.56.1

