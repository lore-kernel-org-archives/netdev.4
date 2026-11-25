Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635420;
	b=2DZ6u/PCiH3xDQwUSyurA8k3GoOIAFaEefcVwnLs2XbRq1CYtMII0PZL38uJpwnCk+Mk
	 AKGaLyeAcs9NCla49gY6vEoXQAlTIzhyBymTNw3FyPnZcYUJk1axM4vSBjd7muZizDUVw
	 H++wLX4UYU5EOf659/BXykmDQ4SCD95Wowf6P+5RggdeBHQSyDGZYhUQFKCfgZWpz0iv+
	 pYjykcws/gnxqXSQ5xdeUXp6kbNL3gO0JdFxFcd1kDkyGWEKqHLMMTGmcIqRGn5IyAFHF
	 rOFPBZmdEFk1CTRm1IfbBWaOSdTyennLH94ZppUguaD77sIvaAlx37wCc2yEgcjTSpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=2dHDItMaeQju5JCWIsWfsyYtjyVRkZnaMexPksVcLO0=;
	b=ZFSngfvUHl7NLjXh1jaVJ6yJ8GGItGmYOvMpwGLm0VW64JyBbWuaO2RjP/rYK43eEyLd
	 rwR/KCeYW3U+VRtQYTTZkSXwhGLy5p4eYc1MZzPNyoLocAooYfh/FhpmOiNJllkagZao9
	 qFWxQEyReiDn8jAlCo/v5JL/3u+CT/GU5yaH6NeILKM6EQUnDwhdZm5NsLu/zCQ89iq3S
	 vF8lSEaHaXbcX0k9if7BH0cFGNvW5mL1k9jtBSUbNQHZ/2IlJAV44LmMAMLzmWefRtrOH
	 6bhhe/0AE1eJKNBYbbdlOl+1DQc7KtAAmDtGXNJ4KD/Rmp1b1QI+Dk+aLQqz2OsdoGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=V1pGyXpN;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253C4606A32E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 19:37:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 253C4606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=V1pGyXpN
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48dee593f18so5773165f8f.3
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795635418; x=1796240218; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2dHDItMaeQju5JCWIsWfsyYtjyVRkZnaMexPksVcLO0=;
        b=V1pGyXpNbCgi6jKvsAMXV8HVjpNvB7JoM7X1VzjLnfIjTMDExtk3ySO9if48rJifKs
         ygvw+tYA2jtVzhuo33Mu2OAEaDJ1VsfGmguo7piwkDnSsA0t/PTSJEQpg9/Dw3JjEgY8
         i0ix92cKf69cSR+zvcDlLCRorlCfVuxKLVwa9iZ9y92yY9uvwM904eHEUnJOtgJRYK++
         UivPYm77p/zB/USjuh5xV6HNyYmT/X3FszOyGjwUbmve0jgj3rk/O2/Z0i4BH1Z9N4Dq
         ZrM7sbQhFMmykHmoPSxzKncTnPUsyc3gtoZ9/W2HLmLG/SJL7/hrJyMwp6Xy4K95KgoL
         1CAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795635418; x=1796240218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2dHDItMaeQju5JCWIsWfsyYtjyVRkZnaMexPksVcLO0=;
        b=1zUHMLvNk6OnpfdR02IehmNMCMLiz/q401RdYaqE7GzBISFh2FL3Jhu7ADs02AdvwC
         S/xq7tDEutXpqfJuaZa57nHaSSL0cv9KSJCPY10/Hls5268V/Z7xrhyRrymm0yFo867r
         Tr0T93KzjmNZRHXl6vLs0cHJa1z1IjlolUGbgEOpEgHi7WBfAs2gotoyrhs99daEWy9o
         Gh0oOnswowtMdgK4M4NPJFV63MSeYnFqSScbpHl9seh0N3FGWxvDJy7IJtREkUWGycYC
         PHGp8r8xOxL5azfxYIw/39xx80+8CEBDnFltYrtXOWMzGs/MLtvGsOcVvFtmw2dWbDQr
         Ngsw==
X-Forwarded-Encrypted: i=1; AL+hErGOevk0zeVtf8FksOcpZqoaUhLFwbYngAi0mElx2FJxiad0dSZvEZcwDXxNRH8qlWI4GXdru7g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dUHZ0MRLo3apN/yMr14SY0PZM6iKQ26TkpsfwXbWNKNuEJu/f
	jrfPv1hbEaFq8iHQBVYsJ8X5YBT4ubUrH8aAxelir/bwqbtC3wdYdcQqO6zHwqAIbJg=
X-Gm-Gg: AZFdTZcaI06aqkKoEwioJdTDmh5eZhFYFfEMj3tFqhvomtb4eWprgWTvU9t3FwDg0eb
	WWy8j4203wLDbLsDNqlvJ7BtAM6nUjiiLAdYrLItHTPgym5s/F08D5nY0S8y5VkSIYexZ7CX/KX
	Dhv9i4uJp/3o1v5ApezNC/xcJ10o8L+Kc6Od6FNG+FJw8187hWbKww4wHtDb+DfcwGgUnknchUE
	f9F6nZrWn1z8a12neTXoGcoWptjgCCGsgBJ8YmeOCA0qXTv/u2e3mM+sZ7pDfJE8czS/pBB9TdR
	kzLCfq/E4MFclRqGmfExn3jfy2spIpjpTS1xuz99ZUAYQb8xhV/UMVDL802es3M64cP/X64vouf
	Ep0+xK9oKWacCgy/KRR9rWXw0/JYVdKsLGG9R/cGNorJIpkLKNffLDJU91nfNxjy38RSgmNaUC1
	S41dCcz0VW9Lg6Uzj3J0XunBxQvEJ3sVHJV73lViPXbR5pnHjdkQaf4C9pL2jCOL9qUC+FXrDWi
	H9fMfIDlFpR/uSs9n77nUYYZ/0icwxAm8vKbHeYhOzwc3LySapmF5Tl62MbfHteMUsOd3gV7uRM
	xNYFH6omYjvpyg7fgS8V4b3DU2rFgLNRTYdqAJpRsC+sLwSM8sk8zaVrbk8GkMgrSP6WGvsCbV9
	OpGHahkvLfg==
X-Received: by 2002:a05:600c:4f07:b0:4bb:5dbf:af06 with SMTP id 5b1f17b1804b1-4bb88804d58mr446216865e9.9.1795635418569;
        Wed, 25 Nov 2026 11:36:58 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm35614063f8f.49.2026.11.25.11.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:36:58 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 25 Nov 2026 23:36:39 +0400
Subject: [PATCH v5 2/5] dt-bindings: net: ethernet-controller: Allow a
 unique ID NVMEM cell
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-rk3576-otp-cpuid-mac-v5-2-b3125c9a5fc8@flipper.net>
References: <20261125-rk3576-otp-cpuid-mac-v5-0-b3125c9a5fc8@flipper.net>
In-Reply-To: <20261125-rk3576-otp-cpuid-mac-v5-0-b3125c9a5fc8@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Willem de Bruijn <willemb@google.com>, 
 Simon Horman <horms@kernel.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1744; i=alchark@flipper.net;
 h=from:subject:message-id; bh=vohlOi2XU6LEq2ZrdPzPMNqYE1lULtEksPUJLyGTL0U=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSzW5wVOvtXI5DPOV69QviV3AfGYF0Wm3t6q4vsWNzaX
 E+vmfe1YyILgxgXg6WYIsvcb0tspxrxzdrl4fEVZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKmO+szwV7YmkO23fLvLrG6jBWHdcyaXWU/SVY17Nf8mf0Z7hJ3pNEaGfVxrrRM
 s2XIeNe94vVf6xs7JH9xLtgvU/Vq/8PuZPvZlnAA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Boards without dedicated storage for a MAC address often still have an
identifier unique to the device, such as a SoC serial number in OTP
memory, and bootloaders on several platforms derive a stable MAC address
from it. The device tree can only reference a stored MAC address, so
such boards depend on the bootloader patching the derived one in.

Allow referencing the unique ID as a "unique-id" NVMEM cell instead.
Leave the derivation to the binding of the referenced cell, as it differs
between platforms.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 .../devicetree/bindings/net/ethernet-controller.yaml          | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
index 30b2a335116e..6966270ff78b 100644
--- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
@@ -24,10 +24,17 @@ properties:
   nvmem-cells:
     maxItems: 1
     description:
-      Reference to an nvmem node for the MAC address
+      Reference to an nvmem node for the MAC address, or for an identifier
+      unique to the device from which the MAC address is derived
 
   nvmem-cell-names:
-    const: mac-address
+    oneOf:
+      - const: mac-address
+      - const: unique-id
+        description:
+          Identifier unique to the device, such as a SoC serial number, from
+          which a stable MAC address is derived. How the address is derived
+          is defined by the binding of the referenced cell.
 
   phy-connection-type:
     description:

-- 
2.56.0

