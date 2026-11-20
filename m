Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134362;
	b=tQCk/ydB/3oGPb7kgKYZbtyYIctVNt8FmMoSbhUebwxGaK0GYNhsyTc/ws9z8L8Rcct/
	 DNH8NYvFWF1eF4+BNOJPQEVj0fh66F98rWGIBRTaBnFlkWN3QYs92202LlVf5LW0Lx7bc
	 1h0YGyCfzH3gcoLXW6/OFK8t/taxJI31bAZDQm+3WvM1UIFmqjKXRCIukkT+DZplZ0H2a
	 SWwB7DxoKMsebsWPuUm+oGqTr6DTGl69CfLFasjlXUFB5u91d1EUmY0bWwDIQrNNh9rio
	 eO4fvMY0RWQBGMExjGmlkKRj380GLVahN2cHZTdAZjxLpyxbi6CxE4MikT/g7uefFuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=6w08ojKvpQJFXR8rAUWt6PkCv2RVjEVYZAF28er5FZo=;
	b=N4VdCexRKsa8fxPGzsp2y1RElq9hgPivRWUuvkhjiNtLK1fwTYKor5creubHURNc3Wxf
	 jWYEo0XgFNvsn507aRTVXh2ovfBiP1vNxdJXL9XMc4Z6mocww5SVwAc+K41wifXfAisa0
	 oh7ex1UygpCMlLP47VDwfXZo24Uch79pyYhzzNLVmn6r9BylIhkAoE8hKsjlJ9VlsS4Iz
	 iwiFr6KmDN3aMQDdsYJKrPsR0VM44JzPOvEvlgakxyWWpesKKt8gBhyysvhd7zTx8ozpI
	 HTgAyZ8p51wqVX6COU48ww0hecaHf7IkhQxjPMmIBU4j1EvKGAIqe13mQjoGScYohWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="O/p/TIxM";
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C017760A3809
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C017760A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O/p/TIxM
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-491971ac844so240217f8f.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134360; x=1795739160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6w08ojKvpQJFXR8rAUWt6PkCv2RVjEVYZAF28er5FZo=;
        b=O/p/TIxMNe1VZNL0tb69pZrpgTyXAasD93YyWm4O4g0OxXiQ3RSyP+C1k2XJcpnnWZ
         57wQmpgoyFahDY7mHlhUmAqXIeRyltFF6XLfMNAnPR+Vs+7LdI/jtzJQztOHkRlITWbJ
         VXgmmiEHRdCou5t1ST1xNBJxZk4gGYchsXSXvc9BAb7nbZLlZAC09xdqLBwWcpIoGE0Q
         XzwajEO2ph+fICyEmYZsaln5bJzkr+Nu+MF/c54njKpwSNJ49uOl0yWg8s3box/C0mIY
         bHPqK18hIDiiVTHrTtEo8IwXNQWgDXP7AOfifUyqRv4PPHPEY8AmczehAFIY67maiQFi
         8cdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134360; x=1795739160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6w08ojKvpQJFXR8rAUWt6PkCv2RVjEVYZAF28er5FZo=;
        b=NXpvOv/lvIIWkTLg5yF+MYmM7nwsHlms0Wgzdp4rhKMz62qcOikdgeFj0kE8xQzbDv
         kSa6WfuF8sMrHK7K+KgSAzOlXK55rT+q7Vxi+Q5gDh1GQs6npP9soaMFASAs49tJsvU2
         W8Zpt6dykirqQQ14bhlhUcYxwvBIFOrVRpgT+Mz7PnA/jSUR+1BSnXl+lk4wmTzAVrhR
         nrxLDAghDLUqpo7CrOPyoWRMF8XiCnRxkUiCQVbSok/h44F+UdfWPOchBjBtYW0R8F/R
         DwGX/Ny8v49/Lsx05WX++yq1hP9Ea8Sl3QB/JoNEhvkBQQnj1Qe6W/fdEr9ykcoVF7AW
         edPg==
X-Forwarded-Encrypted: i=1; AL+hErFDUtB2hBiGhugTWFlQVFt5tPfaTVP8AQrdV7+d2iTB/xX4Ahg1Dx+ESVxEUT5xBDt5Jdg+aJ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8W1CGyRiRV7yamd7HNZ1X65mwKbQ/8oM4gb/nqX3dFYp4IFvGV
	GS8qNpCwMyVXx85o2reSNWBZXMWYVxVGeKLJsKiSggwOd4dfWPU4DSqb
X-Gm-Gg: AYBFou0TSBnqZ7q912sfWxClmFkuw61ZOfL9UP5Z/NsjxXmp9I+R/DgzjIH/1dZ49PH
	PW7YthULUGMnxuQiUl1yRLv/jqL1sepfKGks48ClUOcR08OehMkob/aSiTzuiCv+FEPxBMf+RDj
	78Qte2Rr/OIbEB2kalzdaMyCcCo7x6a0kbpM4J7HBLhZDVxnV0huwCyb8G+PwxGUufuf7x4R7g4
	4nS5qvL1a1cejWoST2N/wqkLZB+0LqOsgfwSxxq7d53oTn7Cppqq8l0kIjW3eX9JRsJG2aqbpv4
	q9GXWktSDw5X7YEkAbX7TnLSKtD6/Tz99Bi8vwLck/J+ItOfS131XhmQSeiYuktynzlhEMF8HGT
	H9nxJtGWA8PadaakbYwryhWOurbJJJKyz7G6JsyKCB8esry7EGgS+HnWGTjlqQVqkrweGe816mh
	0ETxYlqDtFnhcTlGYGCxl4jTwDIDd9J6Sp0VkfQOLF4xLTqopttS7obXKZtnX1W3PBvi3Z0r547
	mWjSfkOtHwuiXVCjoQL7WeXkT/G+9gpZ4+n2iE78TmLKZFdkd+sv87Ci58m2TUqskucQL5qkuRN
	8iiRQ5tt2WQEMYfIw/WrZre0fCTZaSxGUdZu56t1IvFHDZiFrPCVgwyYk4FBAHnxr/ED1gNqq5T
	sMQCgkBMnkri+4P45xF6nMvboBj/t+khIC2ngiiiUrJ/w4PZr8QcYeGcWR+x7k7hLA+1ILvt3Eg
	==
X-Received: by 2002:a05:600c:848d:b0:4bb:6687:5386 with SMTP id 5b1f17b1804b1-4bb8880c7f1mr29095585e9.19.1795134360078;
        Thu, 19 Nov 2026 16:26:00 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:25:59 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v5 06/24] dt-bindings: net: dsa: renesas,rzn1-a5psw: Limit port reg values
Date: Fri, 20 Nov 2026 00:25:16 +0000
Message-ID: <20261120002549.1908299-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The A5PSW has four external ports and a CPU management port, using
port numbers from 0 to 4.

Previously, the patternProperties expression only matched port nodes
with unit addresses from 0 to 4. This allowed port nodes with other
unit addresses to bypass the port-specific schema constraints.

Update the pattern to match all port nodes and limit their reg values
to a maximum of 4. This ensures the constraint is applied regardless
of the unit address.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- Replaced the patternProperties expression
- Added maximum constraint for reg values
- Updated commit subject and description

v3->v4:
- Added reg items validation for ethernet ports
 
v2->v3:
- New patch
---
 .../devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml       | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
index 9c477ceb170b..30f25b06d62c 100644
--- a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
@@ -65,10 +65,12 @@ properties:
     type: object
     additionalProperties: true
     patternProperties:
-      "^(ethernet-)?port@[0-4]$":
+      "^(ethernet-)?port@":
         type: object
         additionalProperties: true
         properties:
+          reg:
+            maximum: 4
           pcs-handle:
             maxItems: 1
             description:
-- 
2.56.1

