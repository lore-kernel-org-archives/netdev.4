Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445713;
	b=uPEOoNz8dN9d/NSwrFBUpB/YwwUN0J0bSbJWpyJ2L0HJUScDOaZt7dLjiyhLJIwVJN8S
	 0oa79Bqy6odIF24+NIF/2pYKEXW189ox7m0Zdz3EqILjeTav0BmDl0enrJ5Y7lD4woAxh
	 flm+ubI72b1Hvq8BK6kypmSzVvaZ+KPNb+woA0y07KnTqj+Ekac/Qk9cI+J8cZftaflpu
	 QRQBvVd3cG5JShvg2tzs7FBfdJqvH1PBaiqaz7i+aBsZlhvS7j5XFAE74bfGpUx/vvOhF
	 tedrXTRP1AvlqXFG0DuIqHHi0dgTM15PNcV7kz9R9SLF0QOwvRW06YjDwXPgVzXZlnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445713;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:X-B4-Tracking:X-Change-ID:To:CC:X-Mailer;
	bh=Pc0ojdFZzlnG3jrdmVTzOVzlBAOKTUij29AsDO7jazM=;
	b=yldzxNEQiPP/Ub7aUcAztQz4nFzEcpPk0JHh42N2FfXsSkriif4qgqPcpPKRdKE6Fu8B
	 pPzH6hg8c8FZJ2XVjnwNVRlNq1Np4Z+y/tApKiL3fMGLoONjL8EB16YvCcYZEAhzoDHrO
	 6UndJL94aFObAUxsxl4+IKPkOaUO/FMe1P0novu+U7zkE5MJsGuvqi7Hx792++VLLsum5
	 Jl+GuXAElln9BLiplAg57VJF7K38ft8QOs8DLakWYgWaNqR6zfoEA9sCHDaUbKAJfW0UD
	 1NBJboS1W7NrBgG8dL9S8otjy5tbhP+U91ENyjS2a3LczUjIRDKo38EYmpuLF25Whhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=SjNvkuYc;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23891606A691
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 14:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23891606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=SjNvkuYc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795445721; x=1826981721;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=cjk51Qv5NMuDXe5avYRemMt+9GS69CVYjYKcxrWGVVo=;
  b=SjNvkuYcc+fB3v1v2bIGrikv8jtnmv/uA7BmFgVOWszfZs+ez6t7TKhO
   mXA0V4KfPH7ke1hXYXJk17ymEe1kULLsGByjplvrvgU28+TUUXF/7QvNL
   D/zfoIf1yz+1jlyn0D7zYrA/+8gaY7jV1mZrfbf9BOwxAQSfKQr0EyIji
   CjaYqU77eK+Y8RIfI1/LMpCHq49a5yh8tJUdbIBNA4tXXtmQegQOB2j+2
   VMuZYYhd1LNmgyXK7La3MEgFoHBbkE7EcO4Tjm/aS6+VJWoNnsvjv2SmT
   JkA8g62ONej0N2X38Tlob7ydwsz3TRi12VALNKkT4+Wrn272aU5/icNKs
   Q==;
X-CSE-ConnectionGUID: 2czfgEj2TimuzdtdpbWqXQ==
X-CSE-MsgGUID: Lwuha7/dQMOrZsaV6NzSRQ==
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="233973959"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Nov 2026 07:55:20 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 23 Nov 2026 07:55:11 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 23 Nov 2026 07:55:10 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Mon, 23 Nov 2026 15:55:04 +0100
Subject: [PATCH net-next] net: microchip: vcap: initialize the top address
 of every VCAP
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
Message-ID: <20261123-microchip-vcap-top-address-v1-1-fd1953fad422@microchip.com>
X-B4-Tracking: v=1; b=H4sIAMdTBGsC/x3MQQrDIBAF0KuEWXcgagmhVyldiP42s6jKjIRAy
 N0rXb7NO8mgAqPHdJJiF5NaBtxtorTF8gFLHiY/+8U5H/grSWvapPGeYuNeG8ecFWa83jEHv6Q
 VIdMImuItxz9/UkHngqPT67p+kD6NhXYAAAA=
X-Change-ID: 20261123-microchip-vcap-top-address-84e0326c8e3d
To: Horatiu Vultur <horatiu.vultur@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.3

The sparx5 and lan966x block init helpers initialize the address range
of each VCAP instance, from first_valid_addr to last_valid_addr, with
the VCAP initialize command. They pass the range as a count of
last_valid_addr - first_valid_addr addresses.

The range is inclusive at both ends and holds one more address than
that, so the top address is never initialized. It keeps whatever the
TCAM held after reset, where it can match traffic until a rule is placed
there.

Pass the full count to initialize the whole range.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/lan966x/lan966x_vcap_impl.c | 2 +-
 drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_vcap_impl.c b/drivers/net/ethernet/microchip/lan966x/lan966x_vcap_impl.c
index eb28df80b2818..c0bd831a32a88 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_vcap_impl.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_vcap_impl.c
@@ -659,7 +659,7 @@ static void lan966x_vcap_block_init(struct lan966x *lan966x,
 
 	__lan966x_vcap_range_init(lan966x, admin, admin->first_valid_addr,
 				  admin->last_valid_addr -
-					admin->first_valid_addr);
+					admin->first_valid_addr + 1);
 }
 
 static void lan966x_vcap_port_key_deselection(struct lan966x *lan966x,
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c b/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c
index 2dee2ce19fce7..b2e76bec8edba 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c
@@ -250,7 +250,7 @@ static void sparx5_vcap_block_init(struct sparx5 *sparx5,
 {
 	_sparx5_vcap_range_init(sparx5, admin, admin->first_valid_addr,
 				admin->last_valid_addr -
-					admin->first_valid_addr);
+					admin->first_valid_addr + 1);
 }
 
 /* Get the keyset name from the sparx5 VCAP model */

---
base-commit: eb6d6c80d35449c27471b1874f13066c09a8964d
change-id: 20261123-microchip-vcap-top-address-84e0326c8e3d

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>

