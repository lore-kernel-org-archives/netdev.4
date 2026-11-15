Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794727625;
	b=Kxhx/Z+6OYabY6pd4nvm7kBQbrWMc/IlNkuhDg3IqvmIZ6i2+noxC58G/emGDa/0SQAr
	 kSOrn6hTHj84fNP561I2kpyGVhYqVlKNV0D1DewVaW2o71m21kTJQvPcm9LAwWQUdMp8V
	 +ZrWFJZP6p1M80KDoAcyHv0fJ5GePsx2MTN7dlTwPssRARoLiyCbFbiz2DNvxpY6pA57X
	 SnzraN0Rz4jLI1E+uS40uOi6eyopKK7G0NnJammn+QMq/COhP9pbgyDahzj5wiPBluNdE
	 ME4OPNhW9qr0Y5L9FTT/VHrZbbiOhyDGRp0yYsotjuX847rrwt/SfI2m5r65scVemXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794727625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TrrlP/d2HPiRLz955YcqAu5XPgbopln3GH9fAOXdYkM=;
	b=Bdz4rJTgCjxwg1y54o7PiW13/yMesUvn0WKOKH0U6T4q7fn62nD3W/15bWde/PHCNNlx
	 l3lO/WHtF82PRUv+aIvLx1IJSQp7UNDqLiaoqlWPnZG4+mmk+oZzb+xvunHl2rxz6QMaP
	 ZE2P3KENW/0Nj9q+16pCC+s7gIUkV2zJs8VWZabyFW14KxQFmnMKpLQCMK/Y3MfiXY1xZ
	 +Hm3HLD49EKQYGenzcXqyyE33cEvQVtdP4U/c+UaYqcvociFQVFtFTORed7hq8KYvxpYG
	 l52MQ4tU4J155OMkCEYr08KcqeRgKWrSTRLr98OtTkkg3zlCkDI36uj6jL6ubl/wo8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ArAH8QDJ;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57885606A31D
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 07:27:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57885606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ArAH8QDJ
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1400747eec.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 23:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794727624; x=1795332424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TrrlP/d2HPiRLz955YcqAu5XPgbopln3GH9fAOXdYkM=;
        b=ArAH8QDJ0NRIHsNmYkVmnnLvmiV3n81oyQ9UekY3EGQ0Qoxf8NFJyWX57VdgqgeeVe
         lBLD03/lQqyZiwJS+xN46W/80ChWKzltdNexrlAcico785RB1izAXKDUgdewrcImasZU
         5q2jd6p9VqgM5z/wqt0kM/TFm7IREzJR6dw580Bau9WGO4KZVLjiliIGTKSAfQ1F52zr
         vGdw+u1cQyFNqRNuPi3OggBLZe/DzyRRLWC+gwnoSTGy+SufWCtvw32KVxVpPs/Cur0X
         +LJtumV7Fri8PtM4xCJ5vD08P4mrtnADKqoCUFOGkRCkPaV8+mjJNJ7WTFfgoBm75lyH
         CNHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794727624; x=1795332424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TrrlP/d2HPiRLz955YcqAu5XPgbopln3GH9fAOXdYkM=;
        b=xFlfn52oKGgbr+C/L9DwAhHjLRg74DIwMiF7XZHffLKhrqewuV54lWqc/lrguO83BK
         g6DsbSSdg8gFpP9fUR926annlE89ue7RJunROVka8fS8RUqW5gfeCntUiGtWBBZbcXXh
         uNvUMny8VhJOCfBPg3L9R/s2N7NK4cqkudg/oMUw10mpJt17Bx5prmZV3yVw5xGpR3Cj
         T6rDNDQUM8V9/8BkTpWEPw7xU5z8Lziy1lTUfMdjm5Gb7zIGn1LrPoKdvglgf5Kl7yyM
         rjcqHC/e1lIMsCiNq0sG43q5YLSyjZPVGUOgF8WERNsXGc0B5hi8NokH8rh8/oN0wkYq
         4QSg==
X-Gm-Message-State: APuU4Z9x+6oTW5BLmqlnqM670RFIqeqzxi1vr3q+S/MYUp8cEnPkJiFH
	+LtBuCzG9MPhiGLUnYeXNT0DjAowPfh+9jEleyzrijpCR4i65y5tEKqzIoxZey+s
X-Gm-Gg: AYBFou0HGHxdS3JCqU8j8BX6NcR8ldC7aZK8KANJikalfZkWtJK7OJxK8gC26jkDswl
	AUTFcYxFFncFGbn0pOCJPEuUW4tLiJwyWIXMUUQth3IHwK/QqR+1DlGUUfrkc+DnqL6XqgGC+bx
	OTS3dKc96ofIzAu/i4HY5cW6kl/34TV61p4lFrwSJrvC+oPv9+bQhQkZjEGPRLd+Qgdp62JkOsp
	auMsdpvh0KUWEEYkps41pWZU4jfDkdh/+SVIi26ehDVROjB4u5BEuYpzKUORZsxVtn+bc6DO7C9
	RiVAjNCEJAh2XEAAKCnISAbLTWK7ax/dKN/pYJvo70l3jajxpv/neWBIMpcSdXh+bfieVUI+zpe
	jpNJov+rg/r+9mlXyoUrBu9z/xS+3gWn8ncixOy/yzng85B2yHvb66AxhJgm18fZ8Xg9+5yGAyF
	dhqgIBciDP204ExoEj3MvrLSHARFolaFkqedNSAK47wat6ObenWcIejd+nE63Xa5DLHhp/Rtht0
	veYL00jRRNpjLRa94fhPkDSeeAdS58tJjQyOftKHLCf9HCO6jZtJqh3WWfSHak81INU9COwxdFh
	cC/8KHUkpSTKDZkFuOT0GiLatg==
X-Received: by 2002:a05:7300:828e:b0:356:7ddb:2e54 with SMTP id 5a478bee46e88-37966a5ce93mr7033920eec.29.1794727624218;
        Sat, 14 Nov 2026 23:27:04 -0800 (PST)
Received: from houminxi ([61.170.225.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d7e5sm22411234eec.3.2026.11.14.23.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:27:03 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Aaron Conole <aconole@redhat.com>,
	Eelco Chaudron <echaudro@redhat.com>,
	Ilya Maximets <i.maximets@ovn.org>
Subject: [PATCH net-next v8 3/3] netlink: specs: correct the ovs specs where they do not match the kernel
Date: Sun, 15 Nov 2026 02:26:38 -0500
Message-ID: <20261115072638.3163018-4-houminxi@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115072638.3163018-1-houminxi@gmail.com>
References: <20261115072638.3163018-1-houminxi@gmail.com>
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

The vport netnsid attribute is signed in the kernel: vport_policy declares
it NLA_S32 and ovs_vport_cmd_fill_info() sends it with nla_put_s32(). A
client reading it as unsigned turns the -1 that peernet2id_alloc() returns
when it cannot assign an identifier into 4294967295. Declare it s32, and
say the same in the uapi comment, which also never said the value is -1
when no identifier could be assigned.

Two dumps shared a request list with their get operation, while the dump
handlers read no request attribute. Each dump now has a request list of its
own with no attributes, so neither advertises an attribute the kernel would
ignore.

Four lists named attributes their handler never reads or sends. The vport
delete goes through lookup_vport() and reads no type. The datapath reply
does not carry upcall-pid, which the uapi reserves for the new request, so
the reply list drops it and the ynl selftest stops printing that field. The
vport new request named the nested options, which the kernel accepts and
ignores. The packet miss event shared its list with the userspace action
event, which alone fills userdata, actions, the tunnel key and the length
of a truncated packet, so the miss event now lists only what a miss sends.

The vport get request can also be answered by port number, because
lookup_vport() falls back to it when the request carries no name, so list
port-no there. The datapath get is served by the name, or by the header
ifindex when the name is absent, which its doc now says, and all four ovs
specs document the header struct the same way. The vport new doc gains the
constraint that an ifindex is only accepted for an internal vport.

The uapi note on the vport name now covers requests other than new and
dump, and names the header member the lookup uses. The note on options says
what the kernel does with the attribute instead of leaving it to the vport
type.

The packet spec declared neither the validate flags nor the admin
permission that the kernel registers on the execute operation.

The vport spec also declared family version 2 where the kernel registers 1.

None of this comes from the set operations added earlier in the series; the
specs have been wrong since the families were introduced.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
 Documentation/netlink/specs/ovs_datapath.yaml | 16 +++++++++----
 Documentation/netlink/specs/ovs_packet.yaml   | 20 +++++++++++-----
 Documentation/netlink/specs/ovs_vport.yaml    | 24 ++++++++++++-------
 include/uapi/linux/openvswitch.h              | 14 ++++++-----
 tools/net/ynl/tests/ovs.c                     |  5 ++--
 5 files changed, 51 insertions(+), 28 deletions(-)

diff --git a/Documentation/netlink/specs/ovs_datapath.yaml b/Documentation/netlink/specs/ovs_datapath.yaml
index 6232760224dc..94ab15251e2a 100644
--- a/Documentation/netlink/specs/ovs_datapath.yaml
+++ b/Documentation/netlink/specs/ovs_datapath.yaml
@@ -12,6 +12,8 @@ definitions:
   -
     name: ovs-header
     type: struct
+    doc: |
+      Header for OVS Generic Netlink messages.
     members:
       -
         name: dp-ifindex
@@ -118,24 +120,28 @@ operations:
   list:
     -
       name: get
-      doc: Get / dump OVS data path configuration and state
+      doc: |
+        Get one OVS data path by name, or by the ifindex in the header when
+        the request carries no name.
       value: 3
       attribute-set: datapath
       dont-validate: [strict, dump]
-      do: &dp-get-op
+      do:
         request:
           attributes:
             - name
-        reply:
+        reply: &dp-reply
           attributes:
             - name
-            - upcall-pid
             - stats
             - megaflow-stats
             - user-features
             - masks-cache-size
             - per-cpu-pids
-      dump: *dp-get-op
+      dump:
+        request:
+          attributes: []
+        reply: *dp-reply
     -
       name: new
       doc: |
diff --git a/Documentation/netlink/specs/ovs_packet.yaml b/Documentation/netlink/specs/ovs_packet.yaml
index e4c5f24b3b01..a9ee84be6e22 100644
--- a/Documentation/netlink/specs/ovs_packet.yaml
+++ b/Documentation/netlink/specs/ovs_packet.yaml
@@ -22,6 +22,8 @@ definitions:
   -
     name: ovs-header
     type: struct
+    doc: |
+      Header for OVS Generic Netlink messages.
     members:
       -
         name: dp-ifindex
@@ -97,14 +99,10 @@ operations:
       value: 1
       attribute-set: packet
       event:
-        attributes: &event-attrs
+        attributes:
           - packet
           - key
-          - userdata
-          - actions
-          - egress-tun-key
           - mru
-          - len
           - hash
     -
       name: action
@@ -112,12 +110,22 @@ operations:
       value: 2
       attribute-set: packet
       event:
-        attributes: *event-attrs
+        attributes: &event-attrs
+          - packet
+          - key
+          - userdata
+          - actions
+          - egress-tun-key
+          - mru
+          - len
+          - hash
     -
       name: execute
       doc: Apply actions to a packet.
       value: 3
       attribute-set: packet
+      dont-validate: [strict, dump]
+      flags: [uns-admin-perm]
       do:
         request:
           attributes:
diff --git a/Documentation/netlink/specs/ovs_vport.yaml b/Documentation/netlink/specs/ovs_vport.yaml
index af7ee56f5f90..7626b578c568 100644
--- a/Documentation/netlink/specs/ovs_vport.yaml
+++ b/Documentation/netlink/specs/ovs_vport.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
 ---
 name: ovs_vport
-version: 2
+version: 1
 protocol: genetlink-legacy
 uapi-header: linux/openvswitch.h
 
@@ -12,6 +12,8 @@ definitions:
   -
     name: ovs-header
     type: struct
+    doc: |
+      Header for OVS Generic Netlink messages.
     members:
       -
         name: dp-ifindex
@@ -116,7 +118,7 @@ attribute-sets:
           min: 0
       -
         name: netnsid
-        type: u32
+        type: s32
       -
         name: upcall-stats
         type: nest
@@ -128,7 +130,9 @@ operations:
   list:
     -
       name: new
-      doc: Create a new OVS vport
+      doc: |
+        Create a new OVS vport. An ifindex is accepted only for an
+        internal vport; any other type returns -EOPNOTSUPP.
       attribute-set: vport
       dont-validate: [strict, dump]
       flags: [uns-admin-perm]
@@ -140,7 +144,6 @@ operations:
             - upcall-pid
             - port-no
             - ifindex
-            - options
     -
       name: del
       doc: Delete existing OVS vport from a data path
@@ -151,17 +154,19 @@ operations:
         request:
           attributes:
             - port-no
-            - type
             - name
     -
       name: get
-      doc: Get / dump OVS vport configuration and state
+      doc: |
+        Get one OVS vport by name, or by port number when the request
+        carries no name.
       attribute-set: vport
       dont-validate: [strict, dump]
-      do: &vport-get-op
+      do:
         request:
           attributes:
             - name
+            - port-no
         reply: &dev-all
           attributes:
             - port-no
@@ -172,7 +177,10 @@ operations:
             - ifindex
             - netnsid
             - upcall-stats
-      dump: *vport-get-op
+      dump:
+        request:
+          attributes: []
+        reply: *dev-all
     -
       name: set
       doc: |
diff --git a/include/uapi/linux/openvswitch.h b/include/uapi/linux/openvswitch.h
index bd77e6fb4a95..b111eb9a0066 100644
--- a/include/uapi/linux/openvswitch.h
+++ b/include/uapi/linux/openvswitch.h
@@ -293,7 +293,9 @@ enum ovs_vport_type {
  * packets sent or received through the vport.
  * @OVS_VPORT_ATTR_IFINDEX: Provides the ifindex of a vport, or sets the desired
  * ifindex while creating a new vport with type %OVS_VPORT_TYPE_INTERNAL.
- * @OVS_VPORT_ATTR_NETNSID: Provides the netns id of the vport if it's not local.
+ * @OVS_VPORT_ATTR_NETNSID: Provides the netns id of the vport if it's not
+ * local, as a signed 32-bit value.  The value is -1 when the identifier could
+ * not be assigned.
  * @OVS_VPORT_ATTR_UPCALL_STATS: Provides upcall statistics for a vport.
  * Contains nested %OVS_VPORT_UPCALL_ATTR_* attributes.
  *
@@ -303,12 +305,12 @@ enum ovs_vport_type {
  * For %OVS_VPORT_CMD_NEW requests, the %OVS_VPORT_ATTR_TYPE and
  * %OVS_VPORT_ATTR_NAME attributes are required.  %OVS_VPORT_ATTR_PORT_NO is
  * optional; if not specified a free port number is automatically selected.
- * Whether %OVS_VPORT_ATTR_OPTIONS is required or optional depends on the type
- * of vport.  None of currently supported vport types support options.
+ * None of currently supported vport types support options, so
+ * %OVS_VPORT_ATTR_OPTIONS is ignored in a %OVS_VPORT_CMD_NEW request and
+ * rejected with -EOPNOTSUPP in a %OVS_VPORT_CMD_SET request.
  *
- * For other requests, if %OVS_VPORT_ATTR_NAME is specified then it is used to
- * look up the vport to operate on; otherwise dp_idx from the &struct
- * ovs_header plus %OVS_VPORT_ATTR_PORT_NO determine the vport.
+ * For requests other than new and dump, if %OVS_VPORT_ATTR_NAME is specified
+ * then it is used to look up the vport to operate on; otherwise dp_ifindex from
  */
 enum ovs_vport_attr {
 	/* private: */
diff --git a/tools/net/ynl/tests/ovs.c b/tools/net/ynl/tests/ovs.c
index d49f5a8e647e..fea7609a68b9 100644
--- a/tools/net/ynl/tests/ovs.c
+++ b/tools/net/ynl/tests/ovs.c
@@ -16,9 +16,8 @@ static void ovs_print_datapath(struct __test_metadata *_metadata,
 		return;
 
 	EXPECT_TRUE((bool)dp->_hdr.dp_ifindex);
-	ksft_print_msg("%s(%d): pid:%u cache:%u\n",
-		       dp->name, dp->_hdr.dp_ifindex,
-		       dp->upcall_pid, dp->masks_cache_size);
+	ksft_print_msg("%s(%d): cache:%u\n",
+		       dp->name, dp->_hdr.dp_ifindex, dp->masks_cache_size);
 }
 
 FIXTURE(ovs)
-- 
2.56.0

