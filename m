Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795673951;
	b=wS+P3VTHAGtWMvHPscAmY9Ju9tQa+4l+MUU89dP/1AK5/ss5zcUnnHRu2qFjGyK2x5w9
	 FxD46wxMAPjcXrNJYtc0ibLQtNYR8gRClgOqd8WN1NGh5n9XoIskLgu5LYcVfSN50iq1h
	 uOq6hHfTiNc6663BjNhLhRsP+pDhNciYIOU2FLWyBB/HRhFFkDAu8JMxUafJmXANkufxh
	 V2Yi9boNsBtOfONt/8S7LbQZiOo9cZBxotibgQtnbuBPUEAdsd7yUSZilNGKDZ4GrW2+p
	 Z+KqK2NoVgW49+k0/WYXqlC1MP7GpeJXH/MRra2E8uEizLKhOkwTw+jczgeRVajleFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795673951;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EK9NlA9A9Ay5zTVdixzrgGUW5jboXGbIDd6mwOWxKCk=;
	b=kWocWEcLGwwMpx3ALOwLm8A6f43m9tpLJa/FcRj35YddVIn8wcrX7DZnLB2isCvsx5Z6
	 47zVmyZ29iDh09fQiriy2ba90PXt/VqKa+bGzn07Z8/DCi1zutGoMxcEiSDq/yNWEaHFm
	 8YNtqPfwWf36frrVV5boA+vcQuajf1CCm9jFy8/gY+tkplPg0pMVX7EWmaqHGY1VSDoJa
	 rpjO5nkLyZU5CM9o5SJc5OgReuzecflh7SsTEZ0MeLwbDORyJXGAJio3035TWq8Ochg1U
	 E4qbqBqAw9GiA20o5CTy7lb9PeVmzzwLfMsJcPUPZAGxOGKasi5j73SAWSB+naWyEZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=YSlz5MgE;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6AF606A31C;
	Thu, 26 Nov 2026 06:19:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C6AF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=YSlz5MgE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=YSlz5MgE46VrwhBT7bRjN0MGppo99ywOBzuzxZaT0Ek0GEfI/1fU8Jdo4+DRHCJ4dPn8DhKtD83es
	 2f047P3FQw5PBajK8OTbk8b5D4l3ocAWT6QR7Xan3YlQL+uQfbI2iISWc3zOVDpCi/PN/cO2+bwnM2
	 GGAQPXO64fdYq+UQ=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76b07cf174f5-597f5;
	Thu, 26 Nov 2026 14:17:59 +0800 (CST)
X-RM-TRANSID:2ee76b07cf174f5-597f5
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHD-W7400297 (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16b07cf15283-5fa97;
	Thu, 26 Nov 2026 14:17:59 +0800 (CST)
X-RM-TRANSID:2ee16b07cf15283-5fa97
From: Aibing Chen <chenaibing@cmss.chinamobile.com>
To: Potnuri Bharat Teja <bharat@chelsio.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] cxgb4: avoid truncating the MSI-X interrupt names
Date: Thu, 26 Nov 2026 14:17:56 +0800
Message-ID: <20261126061756.1856-1-chenaibing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
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

The MSI-X interrupt names are assembled with snprintf() into
adap->msix_info[].desc[IFNAMSIZ + 10], from adap->port[0]->name (up to
IFNAMSIZ - 1 characters) plus a suffix and a queue index:

  "%s-Rx%d"         needs up to 30 bytes
  "%s-mirrorrxq%d"  needs up to 37 bytes
  "%s-%s%d"         needs up to 43 bytes

The last one also formats the ULD queue name, which is copied from the
ULD with memcpy(rxq_info->name, uld_info->name, IFNAMSIZ) into a
char[IFNAMSIZ] field, so it can be up to IFNAMSIZ - 1 characters as well.

Because -Wformat-truncation is enabled for W=1 builds and COMPILE_TEST
configurations turn it into an error through CONFIG_WERROR, the driver
does not build today:

  cxgb4_main.c:1074:48: error: '%d' directive output may be truncated
    writing between 1 and 11 bytes into a region of size between 8 and
    23 [-Werror=format-truncation=]
  cxgb4_main.c:1356:47: error: '%d' directive output may be truncated
    writing between 1 and 5 bytes into a region of size between 1 and 16
  cxgb4_uld.c:141:38: error: '%s' directive output may be truncated
    writing up to 15 bytes into a region of size between 10 and 25

Size desc[] for the worst case, 42 characters plus the terminator, which
is IFNAMSIZ + 27 bytes.

Compile tested only, with W=1 before and after the change; no Chelsio
hardware was available to exercise the driver.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202604141419.a4vuNBN7-lkp@intel.com/
Signed-off-by: Aibing Chen <chenaibing@cmss.chinamobile.com>
---
 drivers/net/ethernet/chelsio/cxgb4/cxgb4.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4.h b/drivers/net/ethernet/chelsio/cxgb4/cxgb4.h
index f20f4bc58..dda787b8d 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4.h
+++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4.h
@@ -1049,7 +1049,7 @@ struct msix_bmap {
 
 struct msix_info {
 	unsigned short vec;
-	char desc[IFNAMSIZ + 10];
+	char desc[IFNAMSIZ + 27];
 	unsigned int idx;
 	cpumask_var_t aff_mask;
 };


